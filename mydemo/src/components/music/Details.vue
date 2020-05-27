<template>
  <div>
    <div class="details_page">
      <!-- 上层 -->
      <div class="detailHeader">
        <div>
          <img :src="'http://127.0.0.1:4000/'+this.list.pimg" alt />
        </div>
        <div class="container">
          <div class="title">{{ this.list.title }}</div>
          <div class="price">
            <span class="psign">￥</span>
            <span class="pnum">{{ this.list.price }}</span>
          </div>
          <div class="yf">
            <div class="ky_item">
              配送费：
              <span>包邮</span>
            </div>
          </div>
          <div class="transport">
            <span class="ttitle">取货方式</span>
            <div>
              <span class="iconfont icon-delivery"></span>
              <span class="txt">快递</span>
            </div>
          </div>
        </div>
      </div>
      <!-- 分割 -->
      <div class="hr">
        <div class="hr_body">
          <div class="lLine"></div>
          <span class="iconfont icon-xiangqing"></span>
          <span class="xq">详情</span>
          <div class="rLine"></div>
        </div>
      </div>
      <!-- 下层 -->
      <div class="detailFooter">
        <div class="ftitle">
          <p>产品详情</p>
        </div>
        <div class="productDetail">
          {{ this.list.title }}
        </div>
      </div>
    </div>
    <!-- 底部菜单栏 -->
    <div class="bottom_bar">
      <div class="bar_item shop_store">
        <div class="shopCart">
          <span class="iconfont icon-shopcart" @click="tt"></span>
          <span>购物车</span>
        </div>
        <div class="store">
          <span class="iconfont icon-shoucang"></span>
          <span>收藏</span>
        </div>
        <div class="store">
          <span class="iconfont icon-kefu"></span>
          <span>客服</span>
        </div>
      </div>
      <div class="bar_item">
        <div class="addCart" @click="addCart">加入购物车</div>
        <mt-popup position="bottom" v-model="popupVisible1">
          <shoppingbtn
            btn_name="加入购物车"
            @getData="childdata"
            :src="this.list.pimg"
            :price="this.list.price"
            :count="this.list.count"
            :product_id="this.id"
            :title="this.list.title"
          ></shoppingbtn>
        </mt-popup>
      </div>
      <div class="bar_item">
        <div class="purchase" @click="purchase">立即购买</div>
        <mt-popup position="bottom" v-model="popupVisible2">
          <shoppingbtn btn_name="立即购买" @getData="childdata"></shoppingbtn>
        </mt-popup>
      </div>
    </div>
  </div>
</template>
<script>
  import shoppingBtn from "./common/shoppingBtn.vue";
  export default {
    props: ["id"],
    data() {
      return {
        popupVisible1: false,
        popupVisible2: false,
        list: []
      };
    },
    created() {
      this.load();
    },
    methods: {
      //跳到购物车
      tt() {
        this.$router.push("/Cart1");
      },
      //加入购物车
      joinCart() {
        console.log("dianji");
      },
      //获取加载详情页
      load() {
        var id = this.id;
        console.log(id);
        var url = "pdetail";
        var obj = { id: this.id };
        this.axios
          .get(url, { params: obj })
          .then(res => {
            this.list = res.data.data;
          })
          .catch(err => {
            console.error(err);
          });
      },
      //绑定加入购物车点击事件
      addCart() {
        //改变 popupVisible1=true 弹出隐藏栏
        this.popupVisible1 = true;
      },
      //绑定加入立即购买点击事件
      purchase() {
        //改变 popupVisible2=true 弹出隐藏栏
        this.popupVisible2 = true;
      },
      //自定义事件 getData 获得来子组件的数据 相应处理事件childdata
      childdata(data) {
        this.popupVisible1 = data;
        this.popupVisible2 = data;
      }
    },
    components: {
      shoppingbtn: shoppingBtn
    }
  };
</script>
<style scoped>
  .details_page {
    width: 100%;
  }
  .detailHeader {
    overflow: hidden;
  }
  .detailHeader img {
    height: 414px;
  }
  .detailHeader .container {
    padding: 11px;
  }
  .detailHeader .title,
  .detailHeader .price {
    font-size: 18px;
    padding-bottom: 8px;
    margin: 0px 0px;
  }
  .detailHeader .container .price {
    color: #ff7100;
    font-size: 20px;
  }
  .detailHeader .container .price .pnum {
    font-size: 22px;
  }
  .detailHeader .container .yf,
  .detailHeader .container .transport {
    display: flex;
    font-size: 14px;
    color: #666666;
  }
  .detailHeader .container .transport {
    justify-content: space-between;
  }
  .detailHeader .container .transport .icon-delivery {
    color: #ff7100;
    font-size: 17px;
    vertical-align: middle;
    font-weight: bolder;
  }
  .detailHeader .container .transport .txt {
    vertical-align: middle;
  }
  .details_page .hr {
    padding: 11px;
    background: #f4f4f4;
  }
  .details_page .hr .hr_body {
    color: #ccc;
    font-size: 13px;
    text-align: center;
    vertical-align: middle;
  }
  .details_page .hr .hr_body .icon-xiangqing {
    font-size: 18px;
    vertical-align: middle;
    margin: 0 2px;
  }
  .details_page .hr .hr_body .xq {
    margin: 0 2px;
  }
  .details_page .hr .hr_body .lLine,
  .details_page .hr .hr_body .rLine {
    width: 50px;
    height: 1px;
    background: #ccc;
    vertical-align: middle;
    display: inline-block;
  }
  .bottom_bar {
    position: fixed;
    bottom: 0;
    height: 45px;
    width: 100%;
    border-top: 1px solid #ccc;
    display: flex;
  }
  .bottom_bar .bar_item {
    height: 100%;
    width: 33.3%;
  }
  .bottom_bar .bar_item img {
    width: 20px;
    height: 20px;
  }
  .bottom_bar .shop_store {
    display: flex;
  }
  .bottom_bar .shop_store > div {
    width: 50%;
    height: 100%;
    border-right: 1px solid #ccc;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: space-around;
  }
  .bottom_bar .shop_store > div > span {
    display: block;
    font-size: 14px;
    color: #666666;
  }
  .bottom_bar .shop_store .icon-shopcart,
  .bottom_bar .shop_store .icon-kefu,
  .bottom_bar .shop_store .icon-shoucang {
    font-size: 22px;
  }
  .bottom_bar .bar_item {
    background: #fff;
  }
  .bottom_bar .bar_item .addCart,
  .bottom_bar .bar_item .purchase {
    height: 100%;
    text-align: center;
    line-height: 45px;
    font-size: 17px;
    color: #fff;
    background: #f5a623;
  }

  .bottom_bar .bar_item .purchase {
    background: #ff7100;
  }
  .detailFooter .ftitle {
    padding: 11px;
    color: #333333;
    font-size: 16px;
    border: 1px solid #f5f5f5;
  }
  .detailFooter .productDetail {
    padding: 8px;
    font-size: 16px;
    margin-top: 12px;
    font-weight: bolder;
  }
</style>
