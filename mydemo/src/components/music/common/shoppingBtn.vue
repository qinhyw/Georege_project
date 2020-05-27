<template>
  <div>
    <div class="container">
      <div class="p">
        <div class="product">
          <div class="product_img">
            <img :src="'http://127.0.0.1:4000/'+this.src" alt />
          </div>
          <div class="product_price">
            <div class="price">
              ￥
              <span class="txt">{{ this.price }}</span>
            </div>
          </div>
        </div>
        <div class="product_count">
          <div class="pcount">
            <span class="count">购买数量</span>
            <div class="btn">
              <mt-button
                size="small"
                class="btn-item change_disable"
                @click="cut"
                >-</mt-button
              >
              <span>{{ this.count }}</span>
              <mt-button size="small" class="btn-item change" @click="add"
                >+</mt-button
              >
            </div>
          </div>
        </div>
      </div>
      <div class="add_product" @click="joinCart">{{ btn_name }}</div>
    </div>
  </div>
</template>
<script>
  export default {
    data() {
      return {
        count: 1
      };
    },
    props: {
      btn_name: { default: "" },
      price: { default: "" },
      src: { default: "" },
      title: { default: "" },
      product_id: { default: "" }
    },
    methods: {
      joinCart() {
        var user_id = sessionStorage.getItem("userId");
        var cprice = this.price;
        var pimg = this.src;
        var ctitle = this.title;
        var products_id = this.product_id;
        var count = this.count;
        var obj = {
          user_id: user_id,
          cprice: cprice,
          products_id: products_id,
          count: count,
          ctitle: ctitle,
          pimg: pimg
        };
        var url = "/addcart";
        this.axios
          .get(url, { params: obj })
          .then(res => {
            console.log(res);
          })
          .catch(err => {
            console.error(err);
          });
      },
      close() {
        this.$emit("getData", false);
      },
      cut() {
        if (this.count > 1) {
          this.count--;
        }
      },
      add() {
        this.count++;
      }
    }
  };
</script>
<style scoped>
  .container {
    width: 414px;
  }
  .container .p {
    width: 402px;
    margin: 0 auto;
    position: relative;
  }
  .product {
    display: flex;
    font-size: 20px;
  }
  .product .product_price {
    margin-top: 15px;
    width: 100%;
    display: flex;
    justify-content: flex-end;
    clear: both;
    height: 80px;
    margin-bottom: 30px;
  }
  .product_img {
    width: 110px;
    height: 110px;
    position: absolute;
    top: -30px;
  }
  .product_img img {
    width: 100%;
    height: 100%;
  }
  .product .price {
    color: #ff7100;
    width: 260px;
  }
  .icon-close {
    font-size: 24px;
    vertical-align: middle;
  }
  .product_count {
    height: 390px;
  }
  .pcount {
    display: flex;
    justify-content: space-between;
    height: 33px;
  }
  .pcount .count {
    font-size: 14px;
  }
  .pcount .btn {
    display: inline-block;
    display: flex;
    flex-direction: row;
  }
  .pcount .btn span {
    width: 33px;
    height: 33px;
    display: block;
    text-align: center;
    line-height: 33px;
    background: #f1f1f1;
    margin: 0 5px;
  }
  .mint-button--default {
    color: #656b79;
    background-color: #f6f8fa;
    -webkit-box-shadow: 0 0 1px #b8bbbf;
    box-shadow: 0 0 0px #fff;
  }
  .mint-button--small {
    display: inline-block;
    font-size: 14px;
    height: 33px;
    padding: 0;
  }
  .btn-item {
    font-size: 25px;
    width: 33px;
    text-align: center;
    border: 0 !important;
    outline: 0;
  }
  .btn-item .changebg {
    background: #f1f1f1;
    color: #878787;
  }
  .btn-item .change_disable {
    background-color: #f9f9f9;
    color: #cacaca;
  }
  .add_product {
    background: #ff7100;
    height: 48px;
    color: #fff;
    font-size: 18px;
    line-height: 48px;
    text-align: center;
    position: fixed;
    bottom: 0;
    width: 100%;
  }
</style>
