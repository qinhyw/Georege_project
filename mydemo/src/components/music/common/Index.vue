<template>
  <div class="page-tabbar">
    <div class="page-wrap">
      <!-- 轮播 -->
      <div class="lb">
        <mt-swipe :auto="4000">
          <mt-swipe-item>
            <img src="../../../img/file_5be243c84a2ac.png" />
          </mt-swipe-item>
          <mt-swipe-item>
            <img src="../../../img/file_5be243c94ec1e.png" />
          </mt-swipe-item>
          <mt-swipe-item>
            <img src="../../../img/file_5be243ca52ecd.png" />
          </mt-swipe-item>
        </mt-swipe>
      </div>
      <!-- 菜单 -->
      <div class="mc">
        <div class="mc_1">
          <div @click="ranking">
            <img src="../../../img/file_5be24a9af3409.png" />
            <span>排行</span>
          </div>
          <div class="mc_2" @click="style">
            <img src="../../../img/file_5be24b7f6454f.png" />
            <span>风格分类</span>
          </div>
          <div @click="radio">
            <img src="../../../img/file_5be24fdf1dc07.png" />
            <span>电台</span>
          </div>
          <div @click="video">
            <img src="../../../img/file_5be24b7ea8fad.png" />
            <span>视频</span>
          </div>
        </div>
      </div>
      <!-- 电台 -->
      <div id="dt">
        <div class="dt_1">
          <div class="dt_3">
            <img src="../../../img/t_15415791635be2a19b65cd3.jpg" />
          </div>
          <div class="dt_4">
            <img src="../../../img/t_15415792655be2a2014b594.png" />
          </div>
          <div class="dt_5">个人电台</div>
        </div>
        <div class="dt_2">
          <div class="dt_6">
            <div class="dt_7">
              <div class="dt_11">萌宠音乐</div>
              <div class="dt_12">萌宠和你一起听音乐</div>
            </div>
            <div class="dt_8">
              <img src="../../../img/t_15415796065be2a356d231a.jpg" />
            </div>
          </div>
          <div class="dt_9">
            <div class="dt_10">
              <div class="dt_11">激情DJ</div>
              <div class="dt_12">燃爆全场的激情音乐</div>
            </div>
            <div class="dt_13">
              <img src="../../../img/t_15415796205be2a364c2d6e.jpg" />
            </div>
          </div>
        </div>
      </div>
      <!-- 每日推荐 -->
      <firstList header_title="每日推荐"></firstList>
      <!-- 最新专辑 -->
      <firstList header_title="最新专辑"></firstList>
      <!-- MV推荐 -->
      <vidoeslist></vidoeslist>
    </div>
  </div>
</template>
<script>
  import FirstList from "./FirstList.vue";
  import VidoesList from "./VidoesList.vue";
  export default {
    data() {
      return {};
    },
    methods: {
      ranking() {
        this.$router.push("/Musiclist");
      },
      style() {
        this.$router.push("/Musicstyle");
      },
      radio() {
        this.$router.push("/Radio");
      },
      video() {
        this.$router.push("/video");
      }
    },
    components: {
      firstList: FirstList,
      vidoeslist: VidoesList
    }
  };
</script>
<style scoped>
  .page-wrap {
    overflow: auto; /*溢出显示轮动条*/
    padding-bottom: 60px;
  }
  /* 轮播图 */
  .lb {
    height: 170px;
  }
  .lb img {
    width: 100%;
  }
  #app {
    width: 100%;
    height: 5000px;
  }
  .mc {
    display: flex;
    width: 100%;
    height: 95px;
    background-color: rgba(0, 0, 0, 0);
    opacity: 1;
    position: relative;
  }
  .mc_1 {
    width: 95%;
    height: 95px;
    display: flex;
    justify-content: space-between;
    opacity: 1;
    background-color: rgb(255, 255, 255);
    border-color: rgb(34, 34, 34);
    border-radius: 6px;
    box-shadow: rgb(229, 229, 229) 0 0 5px;
    position: absolute;
    left: 10px;
    top: -8px;
  }
  .mc_1 > div {
    width: 25%;
    height: 100%;
  }
  .mc_1 img {
    display: flex;
    margin-top: 17%;
    margin-left: 28%;
    height: 30%;
  }
  .mc_1 span {
    display: flex;
    margin-top: 14%;
    margin-left: 28%;
    text-align: left;
    font-size: 14px;
    color: rgb(53, 53, 53);
  }
  .mc_2 span {
    margin-left: 13%;
  }
  #dt {
    width: 100%;
    height: 140px;
    display: flex;
    justify-content: space-between;
    position: relative;
    clear: both;
  }
  #dt > .dt_1 {
    width: 35%;
    background-color: rgb(229, 229, 229);
    border-color: rgb(34, 34, 34);
  }
  #dt > .dt_2 {
    width: 60%;
    background-color: #fff;
  }
  .dt_3 img {
    width: 100%;
    margin-top: 10px;
    margin-left: 10px;
  }
  .dt_4 {
    background-color: transparent;
    border-color: rgb(34, 34, 34);
    position: absolute;
    opacity: 1;
    top: 46%;
    left: 13%;
  }
  .dt_4 img {
    width: 44%;
  }
  .dt_5 {
    font-size: 16px;
    font-weight: boid;
    opacity: 1;
    background-color: rgba(0, 0, 0, 0);
    color: rgb(255, 255, 255);
    position: absolute;
    top: 72%;
    left: 10%;
  }
  .dt_6,
  .dt_9 {
    width: 90%;
    height: 40%;
    margin: 6% auto;
    display: flex;
  }
  .dt_7,
  .dt_10 {
    width: 70%;
    height: 100%;
    background-color: rgb(243, 243, 243);
    position: relative;
  }
  .dt_8,
  .dt_13 {
    width: 30%;
  }
  .dt_8 img,
  .dt_13 img {
    width: 100%;
  }
  .dt_11 {
    font-size: 16px;
    color: rgb(53, 53, 53);
    position: absolute;
    top: 26%;
    left: 4%;
  }
  .dt_12 {
    font-size: 14px;
    color: rgb(153, 153, 153);
    position: absolute;
    top: 60%;
    left: 4%;
  }
</style>
