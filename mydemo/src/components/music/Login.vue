<template>
    <div>
        <mt-field label="用户名" placeholder="请输入用户名" v-model="uname" :attr="{autofocus:true}"></mt-field>
        <mt-field label="密码" placeholder="请输入密码" v-model="upwd" class="field1"></mt-field>
        <div>
            <input type="text" id="input1" v-model="input1">
            <canvas id="c3" width="170" height="48" @click="suibian"></canvas>
        </div>
        <mt-button size="large" @click="login">登录</mt-button>
        <span>还没有账号？点击 <mt-button @click="zc" style="width:226.27px">马上注册</mt-button></span>
    </div>
</template>
<script>
export default {
  data(){
    return{
      uname:"",
      upwd:"",
      yzm:"",
      input1:""
    }
  },
  mounted() {
    var c3 = document.getElementById("c3");
    var ctx =c3.getContext("2d");
    var a = Math.floor(Math.random()*10);
    var b = Math.floor(Math.random()*10);
    var c = Math.floor(Math.random()*10);
    var d = Math.floor(Math.random()*10);
    this.yzm=a+""+b+""+c+""+d;
    // console.log(abcd);
    // console.log(a);
    ctx.font="26px SimHei"
    ctx.fillText(this.yzm,60,38);
  },
  methods:{
    suibian(){
      var c3 = document.getElementById("c3");
      var ctx =c3.getContext("2d");
      ctx.clearRect(0,0,170,48);
      var a = Math.floor(Math.random()*10);
      var b = Math.floor(Math.random()*10);
      var c = Math.floor(Math.random()*10);
      var d = Math.floor(Math.random()*10);
      this.yzm=a+""+b+""+c+""+d;
      // console.log(abcd);
      // console.log(a);
      ctx.font="26px SimHei"
      ctx.fillText(this.yzm,60,38);
    },
    login(){
      var u=this.uname;
      var p=this.upwd;
      var ipt=this.input1;
      var yzm=this.yzm;
      var reg=/^[a-z0-9]{3,12}$/i;
      if(reg.test(u)==false){
        this.$messagebox("用户名格式不正确");
        return;
      }
      if(reg.test(p)==false){
        this.$messagebox("密码格式不正确");
        return;
      }
      if(ipt!=yzm){
        this.$messagebox("验证码不正确");
        return;
      }
      var url="login";
      var obj={
        uname:u,
        upwd:p
      };
      this.axios.get(
        url,
        {params:obj}
      ).then(res=>{
        if(res.data.code<0){
          this.$messagebox("信息","用户名或者密码错误");
        }else{
          sessionStorage.setItem("userId",res.data.data.id);
          sessionStorage.setItem("userName",res.data.data.uname);
          this.$router.push("/Home");
        }
      });
    },
    zc(){
      this.$router.push("/Reg"); 
    }
  }
}
</script>
<style>
    .field1{border-bottom:1px solid #d9d9d9}
    #input1{
        margin-top:5px;margin-left:6px;height:48px;
    }
    #c3{
        transform: translateY(18px);
        background-color:#ddd; 
    }
</style>