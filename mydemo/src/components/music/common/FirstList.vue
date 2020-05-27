<template>
  <div>
    <div id="fristList">
      <div class="firstList">
        {{ header_title }}
        <div class="gd" @click="move">更多 ></div>
      </div>
      <div class="firstList_1">
        <div v-for="(item,index) of list" :key="index" @click="lists(item)">
          <img :src="'http://127.0.0.1:4000/'+item.mpicture" />
          <div>{{ item.mtitle }}</div>
          <div>{{ item.singer }}</div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  export default {
    props: {
      header_title: { default: "" }
    },
    data() {
      return {
        list: [],
        pno: 0
      };
    },
    created() {
      if (this.header_title == "每日推荐") {
        this.load_tj();
      } else {
        this.load_zj();
      }
    },
    methods: {
      move() {
        this.$router.push("/Musiclist");
      },
      lists(item) {
        var id = item.id;
        this.$router.push("/Mdetail/" + id);
      },
      load_tj() {
        //1:创建url
        var url = "index_tj";
        //2:创建obj参数 保存多页
        // this.pno++;
        var obj = { pno: this.pno };
        //3:发送axios请求
        this.axios.get(url).then(res => {
          //4:接收返回结果并且显示
          this.list = res.data.data;
          //拼接上一页和下一页数组
          // var rows = this.list.concat(res.data.data);
          //赋值
          // this.list = rows;
        });
      },
      load_zj() {
        //1:创建url
        var url = "index_zj";
        //2:创建obj参数 保存多页
        // this.pno++;
        var obj = { pno: this.pno };
        //3:发送axios请求
        this.axios.get(url).then(res => {
          //4:接收返回结果并且显示
          this.list = res.data.data;
          //拼接上一页和下一页数组
          // var rows = this.list.concat(res.data.data);
          //赋值
          // this.list = rows;
        });
      }
    }
  };
</script>
<style scoped>
  #firstList {
    width: 100%;
    height: 388px;
    opacity: 1;
  }
  .firstList {
    width: 100%;
    height: 15%;
    font-size: 18px;
    line-height: 50px;
    padding-left: 20px;
    font-weight: bold;
    position: relative;
  }
  .gd {
    position: absolute;
    top: 1px;
    right: 22px;
    font-size: 16px;
    color: rgb(53, 53, 53);
  }
  .firstList_1 {
    width: 100%;
    height: 85%;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
    text-align: center;
  }
  .firstList_1 > div {
    width: 30%;
    height: 48%;
    margin-bottom: 2%;
  }
  .firstList_1 > div img {
    width: 100%;
    height: 70%;
  }
  .firstList_1 > div > div:nth-child(2) {
    font-size: 16px;
    font-weight: bold;
    color: rgb(53, 53, 53);
    margin-bottom: 4px;
  }
  .firstList_1 > div > div:nth-child(3) {
    font-size: 12px;
    font-weight: normal;
    color: rgb(68, 68, 68);
  }
</style>
