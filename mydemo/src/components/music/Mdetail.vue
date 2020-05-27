<template>
  <div class="mdetail">
    <div class="title">歌曲详情</div>
    <div class="header">
      <div class="header_img">
        <img :src="'http://127.0.0.1:4000/'+item.mpicture" />
      </div>
      <div class="header_singer">
        <div>{{item.mtitle}}</div>
        <div>{{item.singer}}</div>
        <div>{{item.mtime}}</div>
      </div>
    </div>
    <div class="tails">{{item.introduce}}</div>
    <div>
      <div class="foot">
        <div><img :src="'http://127.0.0.1:4000/'+item.mpicture" /></div>
        <div>
          <div>{{item.singer}}</div>
          <div>{{item.mtitle}}</div>
          <div>{{item.singer}}</div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  props:["id"],
  data(){
    return{
      item:[]
    }
  },
  created(){
    this.detail()
  },
  methods: {
    detail(){
      //1.创建url
      var url="Mdetail";
      var obj={id:this.id};
      this.axios.get(url,{params:obj}).then(res=>{
        this.item=res.data.data[0];
        console.log(this.item);
      })
      
    }
  },
}
</script> 
<style>
  * {
    margin: 0;
    padding: 0;
  }
  .title {
    width: 100%;
    height: 60px;
    border-color: rgb(34, 34, 34);
    border-style: none;
    border-width: 0.046875rem;
    color: rgb(53, 53, 53);
    font-size: 19px;
    font-weight: bold;
    line-height: 60px;
    padding-left: 10%;
  }
  .header {
    width: 100%;
    height: 100px;
    display: flex;
  }
  .header_img {
    width: 40%;
    height: 82px;
    margin-left: 5%;
    margin-top: 2%;
  }
  .header_img img {
    height: 100%;
    border-radius: 20px;
  }
  .header_singer {
    width: 60%;
    background-color: rgba(0, 0, 0, 0);
    border-color: rgb(34, 34, 34);
    border-style: none;
  }
  .header_singer > div {
    color: rgb(53, 53, 53);
    font-size: 16px;
    height: auto;
    line-height: 0.585938rem;
    padding: 10px;
  }
  .tails {
    width: 90%;
    background-color: rgba(0, 0, 0, 0);
    border-color: rgb(34, 34, 34);
    border-style: none;
    color: rgb(53, 53, 53);
    font-size: 15px;
    height: auto;
    line-height: 25px;
    opacity: 1;
    text-align: left;
  }
  .foot {
    width: 100%;
    height: 90px;
    display: flex;
    border: 1px solid #ccc;
    margin-top: 3%;
  }
  .foot > div:nth-child(1) {
    width: 20%;
    height: 100%;
    margin-left: 5%;
    margin-top: 2%;
  }
  .foot > div:nth-child(1) img {
    width: 100%;
    border-radius: 20px;
  }
  .foot > div:nth-child(2) {
    width: 80%;
    margin-left: 10%;
  }
  .foot > div:nth-child(2) > div {
    padding-bottom: 5px;
  }
</style>

