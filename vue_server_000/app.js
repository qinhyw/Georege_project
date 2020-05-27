//1:下载三个模块
//  cors            完成跨域处理
//  express-session session对象
//  mysql           数据库驱动
//  express         web服务器
//下载命令在线
//npm i cors express-session express  mysql
//2:将以上四个模块引入到当程序
const express = require("express");
const mysql = require("mysql");
const cors = require("cors");
const session = require("express-session");
//3:创建数据库连接池(池 提高效率)
var pool = mysql.createPool({
  host: "127.0.0.1", //数据库地址
  user: "root", //数据库用户名
  password: "", //数据库密码
  port: 3306, //数据库端口
  database: "music", //库名
  connectionLimit: 15 //15连接
});
//4:配置跨域模块
//  允许哪个程序跨域访问服务器
//  脚手架:3001 允许3001访问我
//  服务器:4000 你
var server = express();
server.use(
  cors({
    //允许程序列表
    origin: ["http://127.0.0.1:8080", "http://localhost:8080"],
    credentials: true //每次请求需要验证
  })
);
//5:配置session模块?????????
server.use(
  session({
    secret: "128位字符串", //安全字符串
    resave: true, //请求时更新数据
    saveUninitialized: true //保存初始数据
  })
);
//6:配置项目静态目录 public
server.use(express.static("public"));
//7:创建express对象绑定4000端口
server.listen(4000);

/* 用户登录 */
server.get("/login", (req, res) => {
  //(1)获取脚手架参数 uname upwd
  var uname = req.query.uname;
  var upwd = req.query.upwd;
  //(2)创建sql语句查询
  var sql = "SELECT id,uname FROM user WHERE uname = ? AND upwd = md5(?)";
  //(3)执行sql语句
  pool.query(sql, [uname, upwd], (err, result) => {
    if (err) throw err;
    //(4)获取执行结果
    //(5)判断查询是否成功 result.length
    if (result.length == 0) {
      res.send({ code: -1, msg: "用户名或密码有误" });
    } else {
      res.send({ code: 1, msg: "登录成功", data: result[0] });
    }
    //(6)将结果返回脚手架
  });
});

//查询商品详情
server.get("/pdetail", (req, res) => {
  //(1)获取脚手架参数 id
  var id = req.query.id;
  console.log(id);
  //(2) 创建sql语句
  var sql = "SELECT * FROM products WHERE id = ?";
  //(3)执行sql语句
  pool.query(sql, [id], (err, result) => {
    if (err) throw err;
    console.log(result);
    //(4)获取执行结果
    //(5) 判断是否查询成功 result.length
    if (result.length < 0) {
      res.send({ code: -1, msg: "失败" });
    } else {
      res.send({
        code: 1,
        msg: "成功",
        data: result[0]
      });
    }
  });
});

// 查询购物车
server.get("/Cart", (req, res) => {
  //(1)获取脚手架参数 id
  var id = req.query.id;
  console.log(id);
  //(2) 创建sql语句
  var sql = "SELECT * FROM shopcart WHERE  user_id=?";
  //(3)执行sql语句
  pool.query(sql, [id], (err, result) => {
    if (err) throw err;
    //(4)获取执行结果
    //(5) 判断是否查询成功 result.length
    if (result.length == 0) {
      res.send({ code: -1, msg: "失败" });
    } else {
      res.send({
        code: 1,
        msg: "成功",
        data: result
      });
    }
  });
});

//将商品添加至购物车
//1:接收请求 GET /addcart
server.get("/addcart", (req, res) => {
  //2:获取当前用户登录凭证 user_id
  var user_id = req.query.user_id;

  //3:如果用户没登录返回错误消息
  if (!user_id) {
    res.send({ code: -1, msg: "请登录" });
    return;
  }
  //4:获取商品编号/商品价格/商品名称
  var products_id = req.query.products_id;
  var ctitle = req.query.ctitle;
  var cprice = req.query.cprice;
  var count = req.query.count;
  var pimg = req.query.pimg;

  //5:查询指定用户是否购买过此商品
  var sql = "SELECT id FROM shopcart WHERE user_id = ? AND  products_id = ?";
  //6:执行sql
  pool.query(sql, [user_id, products_id], (err, result) => {
    if (err) throw err;
    //7:在回调函数判断是否购买过
    if (result.length == 0) {
      console.log(result);
      //8:添加一条数据
      var sql = `INSERT INTO shopcart VALUES(null,${user_id},${products_id},${count},${cprice},'${pimg}','${ctitle}',NULL)`;
      // NULL, 1, 1, 1, 99.88, "img/products/05.png", "悟哼";
    } else {
      //9:更新一条数据
      var sql = `UPDATE shopcart SET count=count+1 WHERE user_id=${user_id} AND  products_id=${products_id}`;
    }
    //10:执行sql
    pool.query(sql, (err, result) => {
      if (err) throw err;
      res.send({ code: 1, msg: "添加成功" });
    });
    //11:将执行结果返回脚手架
  });
});

/* 用户注册 */
server.get("/Reg", (req, res) => {
  var uname = req.query.uname;
  var upwd = req.query.upwd;
  //判断用户名重复
  var sql1 = "select *from user where uname=?";
  //插入数据库
  var sql2 = "insert into user set uname=?,upwd=md5(?)";
  //查找数据库中是否有重复用户名
  pool.query(sql1, [uname], (err, result) => {
    if (err) throw err;
    if (result.length > 0) {
      res.send({ code: 0, msg: "用户名重复" });
    } else {
      //如果没有重复用户名，则插入数据
      pool.query(sql2, [uname, upwd], (err, result) => {
        if (err) throw err;
        if (result.affectedRows > 0) {
          //再次查找数据库获得注册用户的id
          pool.query(sql1, [uname], (err, result) => {
            if (err) throw err;
            if (result.length > 0) {
              res.send({ code: 1, msg: "用户注册成功", data: result[0] });
            }
          });
        } else {
          res.send({ code: -1, msg: "用户注册失败" });
        }
      });
    }
  });
});

/*首页 每日推荐*/
server.get("/index_tj", (req, res) => {
  //2:接收二个参数
  // pno 页码 pagePageSize 页大小
  var pno = req.query.pno;
  var ps = req.query.pageSize;
  //3:设置默认值 pno=1 pageSize=4
  if (!pno) {
    pno = 1;
  }
  if (!ps) {
    ps = 6;
  }
  //4:计算第一问号值
  var off = (pno - 1) * ps;
  //5:对pageSize转int
  ps = parseInt(ps);
  //6:创建sql语句
  //自己写:库名;表名;列名 小写
  var sql =
    "SELECT id,mtitle,singer,mpicture,mpath FROM audio WHERE is_day=1 LIMIT ?,?";
  //7:执行sql语句
  pool.query(sql, [off, ps], (err, result) => {
    if (err) throw err;
    if (result.length > 0) {
      res.send({ code: 1, msg: "查询成功", data: result });
    }
  });
  //8:将返回结果发送脚手架
});

/*首页 最新专辑*/
server.get("/index_zj", (req, res) => {
  //2:接收二个参数
  // pno 页码 pagePageSize 页大小
  var pno = req.query.pno;
  var ps = req.query.pageSize;
  //3:设置默认值 pno=1 pageSize=4
  if (!pno) {
    pno = 1;
  }
  if (!ps) {
    ps = 6;
  }
  //4:计算第一问号值
  var off = (pno - 1) * ps;
  //5:对pageSize转int
  ps = parseInt(ps);
  //6:创建sql语句
  //自己写:库名;表名;列名 小写
  var sql =
    "SELECT id,mtitle,singer,mpicture,mpath FROM audio WHERE is_new_music=1 LIMIT ?,?";
  //7:执行sql语句
  pool.query(sql, [off, ps], (err, result) => {
    if (err) throw err;
    if (result.length > 0) {
      res.send({ code: 1, msg: "查询成功", data: result });
    }
  });
  //8:将返回结果发送脚手架
});

/*首页 MV推荐*/
server.get("/index_mv", (req, res) => {
  //获得页码
  //获得页大小
  var pno = req.query.pno;
  var ps = req.query.ps;
  //设置默认页码、页大小
  if (!pno) {
    pno = 1;
  }
  if (!ps) {
    ps = 4;
  }
  //对页大小强制转换成int
  ps = parseInt(ps);
  //计算第一问号值
  var off = (pno - 1) * ps;
  //创建sql语句
  var sql = "select id,vname,vtitle,vbg from vidoes where is_mv=1 limit ?,?";
  pool.query(sql, [off, ps], (err, result) => {
    if (err) throw err;
    if (result.length > 0) {
      res.send({ code: 1, msg: "获取数据成功", data: result });
    } else {
      res.send({ code: 0, msg: "获取数据失败" });
    }
  });
});

/*首页 视频列表*/
server.get("/index_sp", (req, res) => {
  var sql = "select id,vtitle,bimg,vbg,vname from vidoes where isvlist=1";
  pool.query(sql, (err, result) => {
    if (err) throw err;
    if (result.length > 0) {
      res.send({ code: 1, msg: "成功获取数据", data: result });
    }
  });
});

/* 商城 乐器 书籍 */
server.get("/product", (req, res) => {
  var fname = req.query.fname;
  var sql = "select id from products_family where fname=?";
  pool.query(sql, [fname], (err, result) => {
    if (result.length > 0) {
      var fid = result[0].id;
      var sql = "select *from products where fid=?";
      pool.query(sql, [fid], (err, result) => {
        if (result.length > 0) {
          res.send(result);
        }
      });
    }
  });
});

/* 商城 热门推荐 */
server.get("/hot", (req, res) => {
  var sql = "select *from products where is_hot=1";
  pool.query(sql, (err, result) => {
    res.send(result);
  });
});
server.get("/address", (req, res) => {
  var obj = req.query;
  var sql = "insert into user_address SET ?";
  pool.query(sql, [obj], (err, result) => {
    if (err) throw err;
    if (result.affectedRows > 0) {
      res.send({ code: 1, msg: "插入成功" });
    }
  });
});
server.get("/ress", (req, res) => {
  var user_id = req.query.user_id;
  var sql = "SELECT * FROM user_address where user_id=?";
  var obj = { user_id: user_id };
  pool.query(sql, [obj], (err, result) => {
    if (err) throw err;
    if (result.length > 0) {
      res.send({ code: 1, msg: "查询成功", data: result });
    }
  });
});
server.get("/Mdetail", (req, res) => {
  var id = req.query.id;
  var sql = "select * from audio where id=?";
  pool.query(sql, [id], (err, result) => {
    if (err) throw err;
    if (result.length > 0) {
      res.send({ code: 1, msg: "查找成功", data: result });
    }
  });
});



server.get("/Mdetail", (req, res) => {
  var id = req.query.id;
  var sql = "select * from audio where id=?";
  pool.query(sql, [id], (err, result) => {
    if (err) throw err;
    if (result.length > 0) {
      res.send({ code: 1, msg: "查找成功", data: result });
    }
  });
});
