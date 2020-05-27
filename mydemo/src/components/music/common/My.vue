<template>
  <div>
    <div class="one-div">
      <div class="one-logo">
        <img src="../../../img/zc_app_default_photo.png" alt="" />
        <span @click="jumplogin">{{ n }}</span>
      </div>
      <div class="one-divs">
        <span class="logspan">></span>
      </div>
    </div>
    <div class="two-div">
      <div class="block-name">电商订单</div>
      <div class="dianshang-div">
        <div>
          <span
            class="shopcartIcon icon-fukuan"
            style="font-size:1.6rem;"
          ></span>
          <span class="font-span">待付款</span>
        </div>
        <div>
          <span
            class="shopcartIcon icon-daifahuo"
            style="font-size:1.6rem;"
          ></span>
          <span class="font-span">待发货</span>
        </div>
        <div>
          <span
            class="shopcartIcon icon-daifahuo1"
            style="font-size:1.6rem;"
          ></span>
          <span class="font-span">待收货</span>
        </div>
        <div>
          <span
            class="shopcartIcon icon-pingjia"
            style="font-size:1.6rem;"
          ></span>
          <span class="font-span">待评价</span>
        </div>
      </div>
    </div>
    <div class="three-div">
      <div class="block-name">我的工具</div>
      <div class="gongju-div">
        <div class="gongju-son-div">
          <span
            class="ShopcartIcon icon-daifahuo1"
            style="font-size:1.5rem;margin-left: 2rem;"
          ></span>
          <span class="mode-two" @click="t1">收货地址</span>
        </div>
        <div class="gongju-son-div">
          <div @click="jumpCart">
            <span
              class="ShopcartIcon icon-gouwuche"
              style="font-size:1.5rem;margin-left: 2rem;"
            ></span>
            <span class="mode-two">购物车</span>
          </div>
        </div>
        <div class="gongju-son-div">
          <span
            class="ShopcartIcon icon-lingdang"
            style="font-size:1.5rem;margin-left: 2rem;"
          ></span>
          <span class="mode-two">系统通知</span>
        </div>
      </div>
    </div>
    <div class="four-div">
      <div class="block-name">会员中心</div>
      <div class="huiyuan-div">
        <div>
          <span
            class="ShopcartIcon icon-huiyuanqia"
            style="font-size:1.5rem;margin-left: 2rem;"
          ></span>
          <span class="mode-two">会员卡</span>
        </div>
        <div>
          <span
            class="ShopcartIcon icon-youhuiquan"
            style="font-size:1.5rem;margin-left: 2rem;"
          ></span>
          <span class="mode-two">优惠券</span>
        </div>
        <div>
          <span
            class="ShopcartIcon icon-jifen"
            style="font-size:1.5rem;margin-left: 2rem;"
          ></span>
          <span class="mode-two">积分</span>
        </div>
        <div>
          <span
            class="ShopcartIcon icon-chuzhijin"
            style="font-size:1.5rem;margin-left: 2rem;"
          ></span>
          <span class="mode-two">储值金</span>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  export default {
    data() {
      return {
        n: ""
      };
    },
    created() {
      this.load();
    },
    methods: {
      t1() {
        this.$router.push("/Address");
      },
      jumplogin() {
        this.$router.push("/Login");
      },
      jumpCart() {
        //功能 跳转购物车组件
        var url = "/Cart";
        var id = sessionStorage.getItem("userId");
        var obj = { id: id };
        this.axios
          .get(url, { params: obj })
          .then(res => {
            if (res.data.code == -1) {
              console.log(res.data.code);
              this.$router.push("/Cart");
            } else {
              this.$router.push("/Cart1");
            }
          })
          .catch(err => {
            console.error(err);
          });
      },
      load() {
        //判断是否有缓存
        if (sessionStorage.getItem("userName") != undefined) {
          this.n = sessionStorage.getItem("userName");
        } else {
          this.n = "请登录";
        }
      }
    },
    props: {
      uname: { default: "" }
    }
  };
</script>
<style>
  #my {
    background-color: #eee;
  }
  .page-wrap {
    overflow: auto; /*溢出显示轮动条*/
    padding-bottom: 60px;
  }
  .one-div {
    background-image: url(../../../img/t_15416406675be391db70a13.jpg);
    height: 123px;
    background-size: 100% 100%;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  .one-logo {
    height: 33px;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  .one-logo span {
    margin-left: 10px;
  }

  .one-divs {
    padding-right: 15px;
  }
  .one-div img {
    width: 30px;
  }
  .one-div span {
    color: #fff;
  }
  .one-div {
    padding-left: 15px;
  }
  .dianshang-div {
    display: flex;
    justify-content: space-around;
  }
  .gongju-div {
    display: flex;
    flex-wrap: wrap;
  }
  .gongju-son-div {
    display: flex;
    align-items: center;
    width: 100%;
  }
  .block-name {
    font-size: 12px;
    text-indent: 1rem;
    height: 3rem;
    line-height: 3rem;
    border-bottom: 1px solid #f3f3f3;
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
  }
  .two-div {
    margin-top: 10px;
  }
  .font-span {
    font-size: 0.9rem;
    display: block;
    margin-left: -7px;
  }
  .three-div {
    margin-top: 10px;
  }
  .four-div {
    margin-top: 10px;
  }
  .mode-two {
    height: 50px;
    line-height: 50px;
    font-size: 0.9rem;
    margin-left: 1rem;
  }
</style>
