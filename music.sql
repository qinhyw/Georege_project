/*设置编码*/
SET NAMES UTF8;
/*如果已经存在相同名字的数据库，丢弃并重新创建*/
DROP DATABASE IF EXISTS music;
/*创建数据库，并且设置编码*/
CREATE DATABASE music CHARSET=UTF8;
/*进入数据库*/
USE music;

/*创建用户表*/
CREATE TABLE user(
  id INT PRIMARY KEY AUTO_INCREMENT,#用户编号
  rname VARCHAR(32),                #用户真实姓名  
  uname VARCHAR(32),                #用户昵称
  upwd VARCHAR(32),                 #用户密码
  gender BOOLEAN,                   #用户性别     
  phone VARCHAR(16),                #手机号码
  avatar VARCHAR(128),              #用户头像地址
  year VARCHAR(16),                 #生日 年
  month VARCHAR(16),                #生日 月
  day VARCHAR(16)                   #生日 日
);

/*创建用户地址表*/
CREATE TABLE user_address(
  id INT PRIMARY KEY AUTO_INCREMENT,#地址编号
  user_id INT,                      #用户编号
  receier VARCHAR(32),              #接受人姓名
  province VARCHAR(16),             #省
  city VARCHAR(16),                 #市
  country VARCHAR(16),              #县
  address VARCHAR(128),             #详情地址
  phone   VARCHAR(16),              #手机号码 
  is_default BOOLEAN                #是否为当前用户的默认收货地址
);

/*创建首页轮播表*/
CREATE TABLE carousel(
  id INT PRIMARY KEY AUTO_INCREMENT,#轮播编号
  img VARCHAR(128),                 #图片地址
  href VARCHAR(128),                #图片链接
  position INT                      #轮播位置 1首页轮播  2商城轮播
);

/*创建商品类别表*/
CREATE TABLE products_family(
  id INT PRIMARY KEY AUTO_INCREMENT,#类别编号
  fname VARCHAR(32)                 #类别名称
);

/*创建商品表*/
CREATE TABLE products(
  id INT PRIMARY KEY AUTO_INCREMENT,#商品编号
  fid INT,                          #类别编号
  title VARCHAR(128),               #商品名称
  pimg VARCHAR(128),                #图片地址
  price DECIMAL(10,2),              #商品价格
  repertory INT,                    #库存数量
  details VARCHAR(128),             #商品详情
  is_hot INT,                       #是否是热门商品 1是 0不是
  is_new INT,                       #是否为新品 1是 0不是
  new_img VARCHAR(128),             #新品宣传图地址
  is_discount INT,                  #是否是秒杀商品 1是 0不是
  dprice DECIMAL(10,2),             #秒杀价格
  dtime BIGINT                      #秒杀时间
);

/*创建用户订单表*/
CREATE TABLE user_order(
  id INT PRIMARY KEY AUTO_INCREMENT,#订单编号
  user_id INT,                      #用户编号
  products_id INT,                   #商品编号
  address_id INT,                   #地址编号
  count INt,                        #购买数量
  status INT,                       #订单状态  1-等待付款  2-等待发货  3-运输中  4-已签收  5-已取消
  order_time BIGINT,                #下单时间
  pay_time BIGINT,                  #付款时间
  deliver_time BIGINT,              #发货时间
  received_time BIGINT              #签收时间
);

/*创建购物车表*/
CREATE TABLE shopcart(
  id INT PRIMARY KEY AUTO_INCREMENT,#购物车编号
  user_id INT,                      #用户编号
  products_id INT,                   #商品编号
  count INT,                         #商品数量
  cprice DECIMAL(10,2),
  cpic   VARCHAR(128),
  ctitle VARCHAR(128),
  cb INT
);

/*创建推荐喜欢表*/
CREATE TABLE recommend(
  id INT PRIMARY KEY AUTO_INCREMENT,#推荐编号
  user_id INT,                      #用户编号
  products_id  INT                   #商品编号
);

/*创建音乐表*/
CREATE TABLE audio(
  id INT PRIMARY KEY AUTO_INCREMENT,#音乐编号
  mfid INT,                         #音乐类别编号
  mtitle VARCHAR(32),               #音乐名称
  singer VARCHAR(32),               #歌手
  mpicture VARCHAR(128),            #图片地址
  mtime VARCHAR(32),                #上架时间  
  introduce VARCHAR(300),           #专辑介绍
  mpath VARCHAR(128),               #音乐地址
  ranking INT,                      #音乐排名
  is_new_music INT,                 #是否是最新专辑 1是 0不是
  is_day INT                     #是否是每日推荐 1是 0不是
);

/*创建歌单表*/
CREATE TABLE music_list(
  id INT PRIMARY KEY AUTO_INCREMENT,#音乐类别编号
  mlname VARCHAR(32),               #歌单名称
  sub_mltitle VARCHAR(128),         #歌单副标题
  mltime VARCHAR(32),               #上架时间
  listen_count INT,                 #听过的人数 万为单位
  source VARCHAR(16),               #类别来源
  bg_img VARCHAR(32),               #背景图路径
  style INT                         #是不是风格 1是 0不是
);

/*创建视频表*/
CREATE TABLE vidoes(
  id INT PRIMARY KEY AUTO_INCREMENT,#编号
  vtitle VARCHAR(128),              #视频主标题
  sub_vtitle VARCHAR(128),          #视频副标题
  vname VARCHAR(16),                #作者
  vimg VARCHAR(128),                #视频路径
  is_mv INT,                        #是不是MV 1是 0不是
  vbg VARCHAR(128),                 #图片地址
  bimg VARCHAR(128),		    #大图片
  isvlist INT                       #是不是视频列表 1是0不是
);

/*创建用户评论表*/
CREATE TABLE comment(
  id INT PRIMARY KEY AUTO_INCREMENT,#评论编号
  user_id INT,                      #用户编号
  products_id INT,                   #商品编号
  vidoe_id INT,                     #视频编号
  container VARCHAR(300)            #评论内容
);

/*数据插入*/
/*商品类别表*/
INSERT INTO products_family VALUES(NULL,"耳机"),(NULL,"书籍"),(NULL,"乐器"),(NULL,"其他");

/*商品表数据插入*/
INSERT INTO products VALUES(NULL,1,"漫步者W280X 无线蓝牙入耳式运动耳机磁吸耳塞","img/products/01.png",169.00,10,"漫步者W280X 无线蓝牙入耳式运动耳机磁吸耳塞",1,0,NULl,1,66.00,NULL),
(NULL,1,"击音K5降噪头戴[一键降噪] 头戴蓝牙Hi-Fi耳机","img/products/02.png",499.00,10,"击音K5降噪头戴[一键降噪] 头戴蓝牙Hi-Fi耳机",1,0,NULl,1,16.00,NULL),
(NULL,1,"漫步者（EDIFIER） H230P 入耳式立体声线控耳机","img/products/03.png",69.00,10,"漫步者（EDIFIER） H230P 入耳式立体声线控耳机",1,0,NULl,1,26.00,NULL),
(NULL,2,"《小王子》","img/products/04.png",24.00,10,"《小王子》",1,0,NULl,0,NULL,NULL),
(NULL,2,"《看见·看不见》","img/products/05.png",66.00,10,"《看见·看不见》",1,0,NULl,0,NULL,NULL),
(NULL,2,"《孩子们的诗》","img/products/06.png",46.00,10,"《孩子们的诗》",1,0,NULl,0,NULL,NULL),
(NULL,3,"G牌民谣云杉单板吉他","img/products/07.png",1679.00,10,"G牌民谣云杉单板吉他",0,0,NULl,0,NULL,NULL),
(NULL,3,"Poputar P1 智能吉他","img/products/08.png",1080.00,10,"Poputar P1 智能吉他",0,0,NULl,0,NULL,NULL),
(NULL,3,"柏聆民谣木吉他","img/products/09.png",689.00,10,"柏聆民谣木吉他",0,0,NULl,0,NULL,NULL),
(NULL,4,"漫步者W280X 无线蓝牙入耳式运动耳机磁吸耳塞","img/products/10.png",399.00,10,"漫步者W280X 无线蓝牙入耳式运动耳机磁吸耳塞",1,0,NULl,0,NULL,NULL),
(NULL,4,"听键 让耳机秒变无线 五种音效+功放芯片 有线耳机必备配件 ","img/products/11.png",109.00,10,"听键 让耳机秒变无线 五种音效+功放芯片 有线耳机必备配件 ",1,0,NULl,0,NULL,NULL),
(NULL,4,"弯头数据线快充2.4A苹果安卓Type-C 玩游戏充电线","img/products/12.png",39.00,10,"弯头数据线快充2.4A苹果安卓Type-C 玩游戏充电线",1,0,NULl,0,NULL,NULL),
(NULL,4,"音乐茶旅-茶饮订阅礼盒-四周音乐主题套装","img/products/13.png",129.00,10,"音乐茶旅-茶饮订阅礼盒-四周音乐主题套装",1,0,NULl,0,NULL,NULL),
(NULL,4,"音乐人年历、黑胶时光机","img/products/14.png",158.00,10,"音乐人年历、黑胶时光机",1,1,"img/products/15.png",0,NULL,NULL);

/*歌单表数据插入*/
INSERT INTO music_list VALUES
(NULL,"轻音乐","让你心情愉悦的轻音乐","2018-08-31",2996,"我的喜好","img/music_list/01.png",1),
(NULL,"爵士音乐","回归经典的爵士音乐","2018-08-31",1760,"官方出品","img/music_list/02.png",1),
(NULL,"流行音乐","最热门的流行音乐","2018-08-31",4866,"我的喜好","img/music_list/03.png",1),
(NULL,"钢琴音乐","安静人心的钢琴乐","2018-08-31",360,"好友推荐","img/music_list/04.png",1),
(NULL,"蓝调音乐","最激情的蓝调音乐","2018-08-31",2996,"我的喜好","img/music_list/05.png",1),
(NULL,"电子音乐","爆炸的电子音乐","2018-08-31",2466,"官方推荐","img/music_list/06.png",1),
(NULL,"萌宠音乐","萌宠和你一起听音乐",NULL,NULL,NULL,"img/music_list/07.jpg",0),
(NULL,"激情DJ","燃爆全场的激情音乐",NULL,NULL,NULL,"img/music_list/08.jpg",0);


/*音乐表数据插入*/
INSERT INTO audio VALUES
(NULL,1,"花","岸部眞明","img/song/01.png",NULL,NULL,"audio/01.mp3",NULL,0,0),
(NULL,1,"新云流水","岸部眞明","img/song/02.png",NULL,NULL,"audio/02.mp3",NULL,0,0),
(NULL,2,"Don't Say Goodbye","Jamestown Story","img/song/03.jpg",NULL,NULL,"audio/03.mp3",NULL,0,0),
(NULL,3,"可不可以","张紫豪","img/song/04.jpg",NULL,NULL,"audio/04.mp3",2,0,0),
(NULL,3,"光年之外","邓紫棋","img/song/05.jpg",NULL,NULL,"audio/05.mp3",1,0,0),
(NULL,3,"最美的期待","周笔畅","img/song/06.jpg",NULL,NULL,"audio/06.mp3",3,0,0),
(NULL,4,"A Little Story","Valentin","img/song/07.png",NULL,NULL,"audio/07.mp3",NULL,0,0),
(NULL,4,"Feeling The Rain","MoreanP","img/song/08.png",NULL,NULL,"audio/08.mp3",NULL,0,0),
(NULL,5,"Toby Fox","M_bread","img/song/09.jpg",NULL,NULL,"audio/09.mp3",NULL,0,0),
(NULL,5,"The Revenant Main Theme","坂本龍一","img/song/10.png",NULL,NULL,"audio/10.mp3",NULL,0,0),
(NULL,6,"Faded","Alen Walker","img/song/11.png",NULL,NULL,"audio/11.mp3",NULL,0,0),
(NULL,6,"Seve(Radio Edit)","Tez Cadey","img/song/12.png",NULL,NULL,"audio/12.mp3",NULL,0,0),
(NULL,7,"违章动物","许嵩","img/song/13.png",NULL,NULL,"audio/13.mp3",NULL,0,0),
(NULL,7,"学猫叫","小潘潘/小峰峰","img/song/14.png",NULL,NULL,"audio/14.mp3",NULL,0,0),
(NULL,7,"萌宠男友","何优冉","img/song/15.png",NULL,NULL,"audio/15.mp3",NULL,0,0),
(NULL,8,"Faded","Alen Walker","img/song/11.png",NULL,NULL,"audio/11.mp3",NULL,0,0),
(NULL,8,"Seve(Radio Edit)","Tez Cadey","img/song/12.png",NULL,NULL,"audio/12.mp3",NULL,0,0),
(NULL,NULL,"荒野猎人","坂本龍一","img/song/03.jpg","2015-12-25","《荒野猎人》根据迈克尔·彭克的长篇小说改编，原著讲述了一名皮草猎人在森林中被熊所伤，他乘船的船长把他救下之后，雇佣了两个人来照顾猎人。没想到这两人见钱眼开，没过多久就把猎人财物抢走，还把他抛在荒野之中。两人原以为猎人就这样离世，没想到猎人竟然奇迹般地活了下来，经历了痛苦的荒野生存之后，猎人开始了复仇计划。","audio/16.mp3",NULL,0,1),
(NULL,NULL,"Love Vs.Life","James Story","img/song/04.jpg","2015-12-25","《荒野猎人》根据迈克尔·彭克的长篇小说改编，原著讲述了一名皮草猎人在森林中被熊所伤，他乘船的船长把他救下之后，雇佣了两个人来照顾猎人。没想到这两人见钱眼开，没过多久就把猎人财物抢走，还把他抛在荒野之中。两人原以为猎人就这样离世，没想到猎人竟然奇迹般地活了下来，经历了痛苦的荒野生存之后，猎人开始了复仇计划。","audio/16.mp3",NULL,0,1),
(NULL,NULL,"光年之外","邓紫棋","img/song/05.jpg","2015-12-25","《荒野猎人》根据迈克尔·彭克的长篇小说改编，原著讲述了一名皮草猎人在森林中被熊所伤，他乘船的船长把他救下之后，雇佣了两个人来照顾猎人。没想到这两人见钱眼开，没过多久就把猎人财物抢走，还把他抛在荒野之中。两人原以为猎人就这样离世，没想到猎人竟然奇迹般地活了下来，经历了痛苦的荒野生存之后，猎人开始了复仇计划。","audio/16.mp3",NULL,0,1),
(NULL,NULL,"最美的期待","周笔畅","img/song/06.jpg","2015-12-25","《荒野猎人》根据迈克尔·彭克的长篇小说改编，原著讲述了一名皮草猎人在森林中被熊所伤，他乘船的船长把他救下之后，雇佣了两个人来照顾猎人。没想到这两人见钱眼开，没过多久就把猎人财物抢走，还把他抛在荒野之中。两人原以为猎人就这样离世，没想到猎人竟然奇迹般地活了下来，经历了痛苦的荒野生存之后，猎人开始了复仇计划。","audio/16.mp3",NULL,0,1),
(NULL,NULL,"可不可以","张紫豪","img/song/07.png","2015-12-25","《荒野猎人》根据迈克尔·彭克的长篇小说改编，原著讲述了一名皮草猎人在森林中被熊所伤，他乘船的船长把他救下之后，雇佣了两个人来照顾猎人。没想到这两人见钱眼开，没过多久就把猎人财物抢走，还把他抛在荒野之中。两人原以为猎人就这样离世，没想到猎人竟然奇迹般地活了下来，经历了痛苦的荒野生存之后，猎人开始了复仇计划。","audio/16.mp3",NULL,0,1),
(NULL,NULL,"既视感","冯提莫","img/song/08.png","2015-12-25","《荒野猎人》根据迈克尔·彭克的长篇小说改编，原著讲述了一名皮草猎人在森林中被熊所伤，他乘船的船长把他救下之后，雇佣了两个人来照顾猎人。没想到这两人见钱眼开，没过多久就把猎人财物抢走，还把他抛在荒野之中。两人原以为猎人就这样离世，没想到猎人竟然奇迹般地活了下来，经历了痛苦的荒野生存之后，猎人开始了复仇计划。","audio/16.mp3",NULL,0,1),
(NULL,NULL,"7荒野猎人","坂本龍一","img/song/10.jpg","2015-12-25","《荒野猎人》根据迈克尔·彭克的长篇小说改编，原著讲述了一名皮草猎人在森林中被熊所伤，他乘船的船长把他救下之后，雇佣了两个人来照顾猎人。没想到这两人见钱眼开，没过多久就把猎人财物抢走，还把他抛在荒野之中。两人原以为猎人就这样离世，没想到猎人竟然奇迹般地活了下来，经历了痛苦的荒野生存之后，猎人开始了复仇计划。","audio/16.mp3",NULL,0,1),
(NULL,NULL,"8荒野猎人","坂本龍一","img/song/09.jpg","2015-12-25","《荒野猎人》根据迈克尔·彭克的长篇小说改编，原著讲述了一名皮草猎人在森林中被熊所伤，他乘船的船长把他救下之后，雇佣了两个人来照顾猎人。没想到这两人见钱眼开，没过多久就把猎人财物抢走，还把他抛在荒野之中。两人原以为猎人就这样离世，没想到猎人竟然奇迹般地活了下来，经历了痛苦的荒野生存之后，猎人开始了复仇计划。","audio/16.mp3",NULL,0,1),
(NULL,NULL,"9荒野猎人","坂本龍一","img/song/10.jpg","2015-12-25","《荒野猎人》根据迈克尔·彭克的长篇小说改编，原著讲述了一名皮草猎人在森林中被熊所伤，他乘船的船长把他救下之后，雇佣了两个人来照顾猎人。没想到这两人见钱眼开，没过多久就把猎人财物抢走，还把他抛在荒野之中。两人原以为猎人就这样离世，没想到猎人竟然奇迹般地活了下来，经历了痛苦的荒野生存之后，猎人开始了复仇计划。","audio/16.mp3",NULL,0,1),
(NULL,NULL,"10荒野猎人","坂本龍一","img/song/11.png","2015-12-25","《荒野猎人》根据迈克尔·彭克的长篇小说改编，原著讲述了一名皮草猎人在森林中被熊所伤，他乘船的船长把他救下之后，雇佣了两个人来照顾猎人。没想到这两人见钱眼开，没过多久就把猎人财物抢走，还把他抛在荒野之中。两人原以为猎人就这样离世，没想到猎人竟然奇迹般地活了下来，经历了痛苦的荒野生存之后，猎人开始了复仇计划。","audio/16.mp3",NULL,1,0),
(NULL,NULL,"11荒野猎人","坂本龍一","img/song/12.png","2015-12-25","《荒野猎人》根据迈克尔·彭克的长篇小说改编，原著讲述了一名皮草猎人在森林中被熊所伤，他乘船的船长把他救下之后，雇佣了两个人来照顾猎人。没想到这两人见钱眼开，没过多久就把猎人财物抢走，还把他抛在荒野之中。两人原以为猎人就这样离世，没想到猎人竟然奇迹般地活了下来，经历了痛苦的荒野生存之后，猎人开始了复仇计划。","audio/16.mp3",NULL,1,0),
(NULL,NULL,"12荒野猎人","坂本龍一","img/song/13.png","2015-12-25","《荒野猎人》根据迈克尔·彭克的长篇小说改编，原著讲述了一名皮草猎人在森林中被熊所伤，他乘船的船长把他救下之后，雇佣了两个人来照顾猎人。没想到这两人见钱眼开，没过多久就把猎人财物抢走，还把他抛在荒野之中。两人原以为猎人就这样离世，没想到猎人竟然奇迹般地活了下来，经历了痛苦的荒野生存之后，猎人开始了复仇计划。","audio/16.mp3",NULL,1,0),
(NULL,NULL,"13荒野猎人","坂本龍一","img/song/14.png","2015-12-25","《荒野猎人》根据迈克尔·彭克的长篇小说改编，原著讲述了一名皮草猎人在森林中被熊所伤，他乘船的船长把他救下之后，雇佣了两个人来照顾猎人。没想到这两人见钱眼开，没过多久就把猎人财物抢走，还把他抛在荒野之中。两人原以为猎人就这样离世，没想到猎人竟然奇迹般地活了下来，经历了痛苦的荒野生存之后，猎人开始了复仇计划。","audio/16.mp3",NULL,1,0),
(NULL,NULL,"14荒野猎人","坂本龍一","img/song/15.png","2015-12-25","《荒野猎人》根据迈克尔·彭克的长篇小说改编，原著讲述了一名皮草猎人在森林中被熊所伤，他乘船的船长把他救下之后，雇佣了两个人来照顾猎人。没想到这两人见钱眼开，没过多久就把猎人财物抢走，还把他抛在荒野之中。两人原以为猎人就这样离世，没想到猎人竟然奇迹般地活了下来，经历了痛苦的荒野生存之后，猎人开始了复仇计划。","audio/16.mp3",NULL,1,0),
(NULL,NULL,"15荒野猎人","坂本龍一","img/song/16.png","2015-12-25","《荒野猎人》根据迈克尔·彭克的长篇小说改编，原著讲述了一名皮草猎人在森林中被熊所伤，他乘船的船长把他救下之后，雇佣了两个人来照顾猎人。没想到这两人见钱眼开，没过多久就把猎人财物抢走，还把他抛在荒野之中。两人原以为猎人就这样离世，没想到猎人竟然奇迹般地活了下来，经历了痛苦的荒野生存之后，猎人开始了复仇计划。","audio/16.mp3",NULL,1,0),
(NULL,NULL,"16荒野猎人","坂本龍一","img/song/10.jpg","2015-12-25","《荒野猎人》根据迈克尔·彭克的长篇小说改编，原著讲述了一名皮草猎人在森林中被熊所伤，他乘船的船长把他救下之后，雇佣了两个人来照顾猎人。没想到这两人见钱眼开，没过多久就把猎人财物抢走，还把他抛在荒野之中。两人原以为猎人就这样离世，没想到猎人竟然奇迹般地活了下来，经历了痛苦的荒野生存之后，猎人开始了复仇计划。","audio/16.mp3",NULL,1,0);
/*视频表插入*/
INSERT INTO vidoes VALUES
(NULL,"睡前一段优美文字一首暖心歌曲。",NULL,"程一","vidoes/01.mp4",0,"img/vidoes/01.png",NULL,0),
(NULL,"小提琴演奏","别有风味的小提琴演奏","卡农","vidoes/03.mp4",0,"img/vidoes/03png",NULL,0),
(NULL,"1修炼爱情",NULL,"林俊杰","vidoes/02.mp4",1,"img/vidoes/02.jpg",NULL,0),
(NULL,"2修炼爱情",NULL,"林俊杰","vidoes/02.mp4",1,"img/vidoes/02.jpg",NULL,0),
(NULL,"3修炼爱情",NULL,"林俊杰","vidoes/02.mp4",1,"img/vidoes/02.jpg",NULL,0),
(NULL,"4修炼爱情",NULL,"林俊杰","vidoes/02.mp4",1,"img/vidoes/02.jpg",NULL,0),
(NULL,"5修炼爱情",NULL,"林俊杰","vidoes/02.mp4",1,"img/vidoes/02.jpg",NULL,0),
(NULL,"十七岁的青春诗篇你我再翻完美一页",NULL,"小明同学","vidoes/04.mp4",0,"img/vidoes/04.png",NULL,1),
(NULL,"十七岁的青春诗篇你我再翻完美一页",NULL,"小明同学","vidoes/04.mp4",0,"img/vidoes/04.png",NULL,1),
(NULL,"十七岁的青春诗篇你我再翻完美一页",NULL,"小明同学","vidoes/04.mp4",0,"img/vidoes/04.png",NULL,1),
(NULL,NULL,NULL,"部门精选音乐","vidoes/04.mp4",0,NULL,"img/vidoes/big01.png",1);
















