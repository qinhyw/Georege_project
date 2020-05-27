<template>
  <div class="page-head">
    <span>{{leftTitle}}</span>
    <span class="h1">{{center}}</span>
  </div>
</template>
<script>
export default {
  name:"TitleBar",
  props:{
    //左侧标题文字
    leftTitle:{default:""},
    center:{default:""}
  },
  data() {
    return {
      
    }
  }
}
</script>
<style scoped>
  /*最外层父元素*/
  .page-head{
  display:flex;
  position:fixed;
  z-index:999;
  width:100%;
  align-items: center;
  background-color:#3E3A39;
  padding-left:7px;
  padding-right:7px;
  height:48px;
  color:#fff;
  font-size:18px;
}
.h1{
  text-align:center;
  margin-left:99px;
}
</style>