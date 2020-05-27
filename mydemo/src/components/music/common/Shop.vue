<template>
  <div>
    <!-- 轮播图 -->
    <div class="lb">
      <mt-swipe :show-indicators="false">
        <mt-swipe-item>
          <img src="../../../img/lb1.jpg" />
        </mt-swipe-item>
        <mt-swipe-item>
          <img src="../../../img/lb2.jpg" />
        </mt-swipe-item>
      </mt-swipe>
    </div>
    <!-- 福利社 -->
    <!-- <div class="fl">
      <div class="text">福利社</div>  
    </div> -->
    <div class="breakline"></div>
    <!-- 福利商品列表 -->
    <div class="list">
      <div class="list-item">
        <div class="inner-content">
          <img src="../../../img/4.png" alt />
          <div class="title-container">
            <div class="title">漫步者</div>
            <div class="list-bottom">
              <div>
                <!-- <span class="price">漫步者</span> -->
                <div class="countdown">
                  <label for>距结束</label>
                  <span class="days">137天</span>
                  <span class="hours countdown-text">17</span>
                  :
                  <span class="minutes countdown-text">12</span>
                  :
                  <span class="seconds countdown-text">38</span>
                </div>
              </div>
              <div class="oldprice-wrap">
                <!-- <span class="oldprice"></span> -->
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="breakline"></div>
    <!-- 新品 -->
    <div class="newproduct">
      <img src="http://127.0.0.1:4000/img/products/15.png" />
    </div>
    <!-- 乐器同好馆 -->
    <div class="vessel">
      <div class="picture">
        <img src="../../../img/5.png" alt />
      </div>
      <div class="text yqthg">乐器同好馆</div>
      <div class="text yqlzy">一起来造乐</div>
    </div>
    <!-- 乐器列表 -->
    <div class="sliding-panel">
      <div class="slide-panel">
        <div
          class="slideitem"
          v-for="(item,i) of yueqi"
          :key="i"
          :data-id="item.id"
        >
          <div class="slideitem-main">
            <div
              class="text"
              style="color:rgb(51,51,51);font-size:14px;width:111px;line-height:27px;text-align:left;position:absolute;left:10px;top:140px;white-space:pre-wrap;word-break:break-all;"
            >
              {{ item.title }}
            </div>
            <div
              class="picture"
              style="width:103px;height:109px;position:absolute;top:23px;left:10px;"
            >
              <img
                :src="'http://127.0.0.1:4000/'+item.pimg"
                style="width:100%;height:100%;"
              />
            </div>
            <!-- <div
              class="text"
              style="color:rgb(255,0,0);font-size:16px;position:absolute;top:197px;left:30px;"
            >
              {{ "￥" + item.price }}
            </div> -->
          </div>
        </div>
      </div>
    </div>
    <!-- 知识馆 -->
    <div class="vessel" style="width:100%;height:177px;margin-top:10px;">
      <div class="picture" style="width:100%;height:100%;">
        <img src="../../../img/7.png" alt style="width:100%;height:100%;" />
      </div>
      <div class="text t" style="position:absolute;top:100px;left:159px;">
        知识馆
      </div>
      <div
        class="text t"
        style="position:absolute;top:130px;left:132px;font-size:16px;color:rgb(178,178,178);"
      >
        书是知识的源泉
      </div>
    </div>
    <!-- 书籍列表 -->
    <div class="sliding-panel">
      <div class="slide-panel">
        <div
          class="slideitem"
          v-for="(item,i) of shuji"
          :key="i"
          :data-id="item.id"
        >
          <div class="slideitem-main ">
            <div
              class="text"
              style="color:rgb(51,51,51);font-size:14px;width:111px;line-height:27px;text-align:left;position:absolute;left:10px;top:140px;white-space:pre-wrap;word-break:break-all;"
            >
              {{ item.title }}
            </div>
            <div
              class="picture"
              style="width:103px;height:109px;position:absolute;top:23px;left:10px;"
            >
              <img
                :src="'http://127.0.0.1:4000/'+item.pimg"
                alt
                style="width:100%;height:100%;"
              />
            </div>
            <!-- <div
              class="text"
              style="color:rgb(255,0,0);font-size:16px;position:absolute;top:197px;left:30px;"
            >
              {{ "￥" + item.price }}
            </div> -->
          </div>
        </div>
      </div>
    </div>
    <div class="breakline"></div>
    <!-- 热门商品 -->
    <div class="vessel" style="width:100%;height:47px;position:relative;">
      <div class="text" style="position:absolute;top:20px;left:149px;">
        热门商品
      </div>
    </div>
    <div class="list">
      <div class="listContent">
        <div class="product" v-for="(item,i) of h" :key="i" :data-id="item.id">
          <div class="pic">
            <img :src="'http://127.0.0.1:4000/'+item.pimg" />
          </div>
          <div class="title">{{ item.title }}</div>
          <div class="price">{{ item.price.toFixed(2) }}</div>
          <mt-button size="small" @click="jump(item.id)">去购买</mt-button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  export default {
    data() {
      return {
        yueqi: [],
        shuji: [],
        h: []
      };
    },
    created() {
      this.yq();
      this.book();
      this.hot();
    },
    methods: {
      jump(id) {
        console.log(id);
        this.$router.push("/details/" + id);
      },
      yq() {
        var url = "/product?fname=乐器";
        this.axios.get(url).then(res => {
          this.yueqi = res.data;
        });
      },
      book() {
        var url = "/product?fname=书籍";
        this.axios.get(url).then(res => {
          this.shuji = res.data;
        });
      },
      hot() {
        var url = "/hot";
        this.axios.get(url).then(res => {
          this.h = res.data;
        });
      }
    }
  };
</script>
<style scoped>
  .lb {
    height: 180px;
  }
  .lb img {
    width: 100%;
  }
  .first {
    margin-left: 0px !important;
  }
  .fl {
    height: 51px;
    display: block;
    width: auto;
    max-width: 100%;
    box-sizing: border-box;
    background-size: 100% 100%;
    background-repeat: no-repeat;
    border-color: #222;
    border-width: 0;
    position: relative;
    overflow: hidden;
  }
  .newproduct {
    height: 130px;
    margin-bottom: 10px;
  }
  .newproduct > img {
    height: 100%;
  }
  .vessel {
    width: 100%;
    position: relative;
  }
  .yq img {
    width: 100%;
  }

  .text {
    color: rgb(68, 68, 68);
    font-size: 20px;
    text-align: left;
    position: absolute;
    top: 10px;
    left: 10px;
  }
  .breakline {
    border-width: 2px;
    border-bottom-style: solid;
    border-bottom-color: rgb(238, 238, 238);
  }
  .list {
    color: rgb(102, 102, 102);
    font-size: 17px;
    padding-top: 10px;
  }
  .list-item {
    position: relative;
    height: 90px;
    padding-left: 5px;
  }
  .inner-content {
    display: inline-block;
    position: relative;
    width: 100%;
  }
  .inner-content img {
    width: 70px;
    height: 82px;
  }
  .title-container {
    width: 299px;
    display: inline-block;
    vertical-align: top;
  }
  .title {
    padding: 0 10px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }
  .list-bottom {
    width: 299px;
    padding: 0 10px;
    position: absolute;
    top: 35px;
  }
  .price {
    color: #f60;
  }
  .countdown {
    background-color: #f31e4a;
    color: #fff;
    font-size: 8px;
    height: 23px;
    line-height: 23px;
    padding: 4px 8px;
    position: absolute;
    top: -2px;
    left: 120px;
  }
  .countdown-text {
    background-color: #9b0020;
    text-align: center;
    height: 20px;
    margin-top: 2px;
    white-space: wrap;
  }
  .oldprice {
    font-size: 8px;
    text-decoration: line-through;
  }
  .oldprice-wrap {
    margin-top: 15px;
  }
  .picture {
    width: 100%;
    height: 172px;
  }
  .picture img {
    width: 100%;
    height: 100%;
  }
  .yqthg {
    top: 99px;
    left: 137px;
  }
  .yqlzy {
    top: 130px;
    left: 146px;
    color: rgb(178, 178, 178);
    font-size: 16px;
  }
  .slide-panel {
    overflow-x: auto;
    overflow-y: hidden;
    white-space: nowrap;
    display: flex;
  }
  .slideitem {
    display: inline-block;
    position: relative;
  }
  .slideitem-main {
    margin-left: 12px;
    height: 223px;
    width: 140px;
    position: relative;
    display: flex;
    flex-direction: column;
  }
  .list {
    margin-top: 30px;
    font-size: 18px;
  }
  .listContent {
    width: 370px;
    height: 100%;
    margin: 0 auto;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
  }
  .listContent .product {
    width: 173px;
    height: 260px;
    display: flex;
    align-items: center;
    flex-direction: column;
    justify-content: space-between;
    margin-bottom: 20px;
  }
  .listContent .product .pic {
    width: 100%;
    height: 153px;
  }
  .listContent .product .pic img {
    width: 100%;
    height: 100%;
  }
  .listContent .product .price {
    font-size: 18px;
    font-weight: bolder;
    color: #353535 !important;
    margin-bottom: 5px;
  }
  .listContent .product > .title {
    width: 100%;
    height: 48px;
    text-align: center;
    white-space: normal;
    overflow: hidden;
    position: relative;
  }
  /* .listContent .product>.title:after{
  content: "...";
  position: absolute;
  bottom: 0;
  right: 0;
} */
  mt-button {
    width: 60px;
    height: 23px;
    border: 1px solid #353533;
    font-size: 14px;
    text-align: center;
    line-height: 23px;
    border-radius: 7px;
  }
</style>
