<template>
  <div id="cart1">
    <div class="top-div">
      <div class="top-div-1">
        <div>
          <button>购物车</button>
        </div>
        <div></div>
        <div class="ShopcartIcon icon-shezhi-copy" @click="del"></div>
      </div>
      <div class="top-div-2">
        <div class="ShopcartIcon icon-dizhi"></div>
        <div>暂无地址，请点击选择地址</div>
      </div>
      <div class="top-div-3">
        <button>全部</button>
        <button>快递</button>
      </div>
    </div>
    <div class="middle-div">
      <div class="middle-div-1" v-for="(item, i) of list" :key="i">
        <div class="check-box">
          <input type="checkbox" v-model="item.cb" @change="itemchange" />
        </div>
        <div class="img">
          <img :src="'http://127.0.0.1:4000/'+item.cpic" alt="" />
        </div>
        <div class="title">
          <span>{{ item.ctitle }}</span>
          <br />
          <span>￥{{ item.cprice.toFixed(2) }}</span>
        </div>
        <div class="count">
          <mt-button @click="cut(i)">-</mt-button>
          <input class="input" v-model=" item.count " />
          <mt-button @click="add(i)">+</mt-button>
        </div>
      </div>
    </div>
    <div class="bottom-div">
      <span class="quanxuanjiesuan">
        <span class="quanxuan">
          <input type="checkbox" @change="selectAll" v-model="allcb" /> 全选
        </span>
        <span class="pull-right">
          <span>合计:</span>
          <span>¥3456</span>
        </span>
      </span>
      <button>结算</button>
    </div>
  </div>
</template>
<script>
  export default {
    data() {
      return {
        list: [],
        allcb: false, //全选按钮状态
        count: 0
      };
    },
    created() {
      this.loadmore();
    },
    methods: {
      cut(i) {
        if (this.list[i].count > 1) {
          this.count = this.list[i].count;
          this.count -= 1;
          this.list[i].count = this.count;
          console.log(this.count);

          // this.axios
          //   .get("/", params)
          //   .then(res => {
          //     console.log(res);
          //   })
          //   .catch(err => {
          //     console.error(err);
          //   });
        }
      },
      add(i) {
        this.list[i].count += 1;
        //console.log(count);
      },
      itemchange() {
        //功能：商品复选框状态修改
        //1：累加复选框状态修改
        //2.创建变量
        var sum = 0;
        //3.创建循坏遍历商品状态
        for (var item of this.list) {
          if (item.cb) {
            sum++;
          }
        }
        console.log(sum);
        console.log(this.list.length);
        //4.如果true变量数据+1
        //5.如果选中数量与数组相同，将全选allcb=true
        if (sum == this.list.length) {
          this.allcb = true;
          console.log(this.allcb);
        } else {
          this.allcb = false;
          console.log(this.allcb);
        }
      },
      selectAll(event) {
        //1.获取参数event
        //2.获取当前全选按钮状态
        var all = event.target.checked;
        console.log(all);
        //3.赋值所有商品cb
        for (var item of this.list) {
          item.cb = all;
        }
      },
      del() {},
      loadmore() {
        //功能 加载购物车
        var url = "/Cart";
        var id = sessionStorage.getItem("userId");
        var obj = { id: id };
        this.axios
          .get(url, { params: obj })
          .then(
            res => {
              // if (res.data.code > 0) {
              //   this.list = res.data.data;
              // } else {
              //(1)为每个商品添加状态
              //res变量data属性data数组
              var list = res.data.data;
              console.log(res);
              for (var item of list) {
                item.cb = false;
              }
              // //(2)赋值
              this.list = list;
              // //(2.9)加载之前先清空
              // this.$router.commit("clearCart");
              // //(3)创建循环遍历数组
              // for (var item of this.list) {
              //   //(4)修改购物车数量
              //   this.$store.commit("addCart");
              // }
            }
            // }
          )
          .catch(err => {
            console.error(err);
          });
      }
    }
  };
</script>

<style>
  #cart1 {
    background-color: #bab4b4;
    height: 100%;
  }
  .top-div {
    background: #ffffff;
  }
  .top-div-1 {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-left: 5%;
    margin-right: 5%;
    padding-top: 5%;
    margin-bottom: 3%;
  }
  .top-div-1 button {
    color: #ffffff;
    background-color: #ff7100;
    height: 2rem;
    width: 6rem;
    border: none;
    font-size: 14px;
    border-radius: 0.4rem;
  }
  .icon-shezhi-copy {
    color: #8d847d !important;
  }
  .icon-dizhi {
    color: #8d847d !important;
    font-size: 14px !important;
    margin-left: 4%;
    line-height: 14px;
  }
  .top-div-2 {
    display: flex;
    justify-content: space-between;
    margin-top: 5%;
    margin-bottom: 2%;
  }
  .top-div-3 {
    height: 40px;
  }
  .top-div-3 button {
    height: 100%;
    width: 49%;
    font-size: 14px;
    border: none;
    background: #ffffff;
  }
  .middle-div {
    background: #ffffff;
  }
  .middle-div-1 {
    width: 100%;
    height: 70px;
    display: flex;
    justify-content: space-between;
    margin-left: 10px;
    margin-right: 10px;
    padding-bottom: 20px;
  }
  .check-box {
    margin-top: 15px;
    width: 10%;
  }
  .middle-div img {
    height: 100%;
  }
  .img {
    width: 30%;
  }
  .title {
    width: 40%;
    font-size: 12px;
    display: flex;
    flex-direction: column;
    justify-content: center;
  }
  .count {
    width: 25%;
  }

  .bottom-div {
    display: flex;
    justify-content: space-between;
    align-items: center;
    z-index: 9;
    position: fixed;
    left: 0;
    right: 0;
    bottom: 0;
    z-index: 99 !important;
    background: #ffffff;
  }
  .quanxuanjiesuan {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%;
  }
  .pull-right {
    font-size: 14px;
  }
  .bottom-div button {
    background: #ff7100;
    border: none;
    width: 120px;
    height: 40px;
    color: #ffffff;
    font-size: 14px;
    line-height: 40px;
    margin-left: 5px;
  }
  .quanxuan {
    margin-left: 10px;
    font-size: 14px;
    height: 40px;
    line-height: 40px;
  }
</style>
