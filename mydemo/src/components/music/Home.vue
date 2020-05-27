<template>
  <div class="page-tabbar">
    <div class="page-wrap">
      <!--Home.vue-->
      <!--1:顶部标题子组件-->
      <TitleBar leftTitle="< 返回" center="首页"></TitleBar>
      <div style="margin-top:48px;"></div>
      <!--切换面板列表-->
      <mt-tab-container class="page-tabbar-container" v-model="active">
        <mt-tab-container-item id="sy">
          <index></index>
        </mt-tab-container-item>
        <mt-tab-container-item id="my">
          <my></my>
        </mt-tab-container-item>
        <mt-tab-container-item id="shop">
          <shop></shop>
        </mt-tab-container-item>
      </mt-tab-container>
      <!--4:tabbar列表-->
      <!--为每个按钮绑定点击事件-->
      <!--当前按钮isSelect:true-->
      <!--其它按钮isSelect:false-->
      <mt-tabbar v-model="active" fixed>
        <mt-tab-item id="sy" @click.native="changeState(0)">
          <tabaricon
            :selectedImage="require('../../img/file_5bdbeda6cde10.png')"
            :normalImage="require('../../img/1.png')"
            :focused="currentIndex[0].isSelect"
          ></tabaricon>首页
        </mt-tab-item>
        <mt-tab-item id="shop" @click.native="changeState(1)">
          <tabaricon
            :selectedImage="require('../../img/2.png')"
            :normalImage="require('../../img/file_5bdbeda630d47.png')"
            :focused="currentIndex[1].isSelect"
          ></tabaricon>商城
        </mt-tab-item>
        <mt-tab-item id="my" @click.native="changeState(2)">
          <tabaricon
            :selectedImage="require('../../img/3.png')"
            :normalImage="require('../../img/file_5bdbeda590f69.png')"
            :focused="currentIndex[2].isSelect"
          ></tabaricon>我的
        </mt-tab-item>
      </mt-tabbar>
    </div>
  </div>
</template>
<script>
import TaBarIcon from "./common/TaBarlcon";
import TitleBar from "./common/TitleBar";
import My from "./common/My";
import Shop from "./common/Shop";
import Index from "./common/Index"
export default {
  data() {
    return {
      //面板中显示子组件id
      active: "sy",
      currentIndex: [
        { isSelect: true },
        { isSelect: false },
        { isSelect: false },
        { isSelect: false }
      ]
    };
  },
  methods: {
    changeState(n) {
      //函数功能:将当前参数下标
      //对应数组值修改true其它修改false
      //1:创建循环,循环数组中内容
      for (var i = 0; i < this.currentIndex.length; i++) {
        //2:判断如果循环下标与n相等
        if (n == i) {
          //3:当前下标元素true 10:22
          this.currentIndex[i].isSelect = true;
        } else {
          //4:其它元素修改false
          this.currentIndex[i].isSelect = false;
        }
      }
    }
  },
  components: {
    tabaricon: TaBarIcon,
    TitleBar: TitleBar,
    My: My,
    Shop: Shop,
    index:Index
  }
};
</script>
<style scoped>
/*最外层父元素Home.vue*/
.page-tabbar {
  overflow: hidden; /*溢出隐藏*/
}
/*修改 tabbar 默认文字颜色*/
.mint-tabbar > .mint-tab-item {
  color: #999999;
}
/*修改默认tab选中文字样式*/
.mint-tabbar > .mint-tab-item.is-selected {
  background-color: transparent;
  color: #f00;
}
</style>
