<template>
  <div>
    <div id="mv">
      <div class="mv">
        MV推荐
        <div class="gd">更多 ></div>
      </div>
      <div class="mv_1">
        <div v-for="(item,index) of list" :key="index">
          <img :src="'http://127.0.0.1:4000/'+item.vbg" />
          <div>{{item.vtitle}}</div>
          <div>{{item.vname}}</div>
        </div>
      </div>
    </div>
    <div class="vidoes" v-for="(item1,n) of list1" :key="n">
      <div id="vitem" v-for="(item2,m) of list2" :key="m">
        <div class="vitem_1">
          <img :src="'http://127.0.0.1:4000/'+item2.vbg" />
        </div>
        <div class="vitem_2">
          <div class="vitem_3">{{item2.vtitle}}</div>
          <div class="vitem_4">
            <img src="../../../img/file_5be3e2cd581e8.png" />
            <span>23万</span>
            <img src="../../../img/file_5be3e36c7efd3.png" />
            <span>169</span>
          </div>
          <div class="vitem_5">
            <div class="vitem_6">
              <img src="../../../img/t_15416619705be3e5126f22c.jpg" />
            </div>
            <div class="vitem_7">{{item2.vname}}</div>
          </div>
          <div>
            <img />
          </div>
        </div>
      </div>
      <div id="bm">
        <div class="bm">
          <img :src="'http://127.0.0.1:4000/'+item1.bimg" />
        </div>
        <div class="kc">
          <div class="bm_1">
            <div class="bm_2">
              <img src="../../../img/t_15416619705be3e5126f22c.jpg" />
            </div>
            <div class="bm_3">{{item1.vname}}</div>
          </div>
          <div class="bm_4">
            <img src="../../../img/file_5be3e2cd581e8.png" />
            <span>23万</span>
            <img src="../../../img/file_5be3e36c7efd3.png" />
            <span>23万</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      list: [],
      list1: [],
      list2: [],
      pno: 0
    };
  },
  created() {
    this.loadMv();
    this.vload();
  },
  methods: {
    loadMv() {
      //创建url
      var url = "/index_mv";
      //创建Obj保存多页
      var obj = { pno: this.pno };
      //发送axois请求
      this.axios.get(url).then(res => {
        //4:接收返回结果并且显示
        this.list = res.data.data;
        //拼接上一页和下一页数组
        // var rows = this.list.concat(res.data.data);
        //赋值
        // this.list = rows;
      });
    },
    vload() {
      var url = "/index_sp";
      this.axios.get(url).then(res => {
        if (res.data.code > 0) {
          for (var item of res.data.data) {
            if (item.bimg == null) {
              this.list2.push(item);
            } else {
              this.list1.push(item);
            }
          }
        }
      });
    }
  }
};
</script>
<style scoped>
.gd {
  position: absolute;
  top: 1px;
  right: 22px;
  font-size: 16px;
  color: rgb(53, 53, 53);
}
#mv {
  width: 100%;
  height: 388px;
  opacity: 1;
}
.mv {
  width: 100%;
  height: 15%;
  font-size: 18px;
  line-height: 50px;
  padding-left: 20px;
  font-weight: bold;
  position: relative;
}
.mv_1 {
  width: 100%;
  height: 85%;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
  text-align: left;
}
.mv_1 > div {
  width: 42%;
  height: 48%;
  margin-bottom: 2%;
}
.mv_1 > div img {
  width: 100%;
  height: 70%;
  border-radius: 20px;
}
.mv_1 > div > div:nth-child(2) {
  font-size: 17px;
  font-weight: bold;
  color: rgb(53, 53, 53);
  margin-bottom: 4px;
}
.mv_1 > div > div:nth-child(3) {
  font-size: 14px;
  font-weight: normal;
  color: rgb(68, 68, 68);
}
#vitem {
  width: 100%;
  height: 140px;
  opacity: 1;
  display: flex;
  justify-content: space-around;
}
.vitem_1 {
  width: 30%;
  height: 100%;
}
.vitem_2 {
  width: 60%;
  height: 100%;
  display: flex;
  flex-direction: column;
  padding-top: 4%;
}
.vitem_1 img {
  width: 100%;
  height: 90%;
  border-radius: 10px;
  margin-top: 10%;
  margin-left: 5%;
}
.vitem_3 {
  width: 100%;
  height: 35%;
  font-size: 17px;
  font-weight: bold;
  color: rgb(68, 68, 68);
}
.vitem_4 {
  width: 100%;
  height: 20%;
}
.vitem_4 img {
  width: 17.5px;
  height: 19px;
  margin-left: 10px;
}
.vitem_5 {
  width: 100%;
  height: 28%;
  display: flex;
}
.vitem_6 {
  width: 30%;
}
.vitem_6 img {
  width: 70%;
  border-radius: 50px;
  margin-left: 12%;
}
.vitem_7 {
  font-size: 15px;
  color: rgb(68, 68, 68);
  line-height: 46px;
}
#bm {
  width: 100%;
  height: 210px;
  display: flex;
  flex-direction: column;
}
.bm {
  width: 100%;
  height: 78%;
}
.bm img {
  width: 92%;
  height: 90%;
  border-radius: 14px;
  margin-left: 4%;
  margin-top: 2%;
}
.kc {
  width: 100%;
  height: 15%;
  display: flex;
  position: relative;
}
.bm_1 {
  width: 50%;
  height: 100%;
}
.bm_2 {
  width: 30%;
}
.bm_2 img {
  width: 70%;
  border-radius: 50px;
  margin-left: 44%;
}
.bm_3 {
  width: 27%;
  font-size: 15px;
  color: rgb(68, 68, 68);
  position: absolute;
  top: 22%;
  left: 18%;
}
.bm_4 {
  width: 50%;
  height: 100%;
}
.bm_4 img {
  width: 17.5px;
  height: 19px;
  margin-left: 10px;
  margin-top: 5px;
}
</style>
