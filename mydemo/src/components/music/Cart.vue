<template>
  <div id="cart">
    <div>
      <div class="empty-cart">
        <img src="../../img/shopping-cart-null.png" alt="" />
        <div class="font-one">购物车空空哒</div>
        <div class="font-two" @click="jumpHome">去逛逛</div>
      </div>
    </div>
  </div>
</template>
<script>
  export default {
    methods: {
      jumpHome() {
        //功能 跳转首页
        this.$router.push("/Home");
      }
    }
  };
</script>
<style>
  #cart {
    background: #f3f3f3;
    height: 667px;
  }
  .empty-cart {
    text-align: center;
    margin-bottom: 2rem;
  }
  .empty-cart img {
    width: 6rem;
    display: inline-block;
    height: 6rem;
    margin: 4rem 0 1rem;
  }
  .font-one {
    font-size: 14px;
    color: #666666;
  }
  .font-two {
    width: 8rem;
    text-align: center;
    line-height: 2.5rem;
    color: #fff;
    background: #ff7100;
    border-radius: 1rem;
    font-size: 1rem;
    display: inline-block;
    margin-top: 2rem;
  }
</style>
