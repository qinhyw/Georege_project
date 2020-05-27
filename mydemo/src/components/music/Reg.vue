<template>
  <div>
    <mt-field label="用户名" placeholder="请输入您的用户名" v-model="uname"></mt-field>
    <mt-field label="密码" placeholder="请输入6-24位字母或数字" v-model="upwd"></mt-field>
    <mt-field label="确认密码" placeholder="请再次输入密码" v-model="nupwd"></mt-field>
    <mt-button size="large" @click="reg">注册</mt-button>
    <span>
      还没有账号？点击
      <mt-button @click="dl">马上登录！</mt-button>
    </span>
  </div>
</template>
<script>
export default {
  data() {
    return {
      uname: "",
      upwd: "",
      nupwd: ""
    };
  },
  methods: {
    reg() {
      var a = this.uname;
      var b = this.upwd;
      var c = this.nupwd;
      // console.log(a+"_"+b);
      var reh = /^[a-z0-9]{3,12}$/i;
      if (reh.test(a) == false) {
        this.$messagebox("用户名格式不正确");
        return;
      }
      if (reh.test(b) == false) {
        this.$messagebox("密码格式不正确");
        return;
      }
      if (b != c) {
        this.$messagebox("两次密码不一致");
        return;
      }
      var url = "Reg";
      var obj = {
        uname: a,
        upwd: b
      };
      this.axios.get(url, { params: obj }).then(res => {
        if (res.data.code > 0) {
          sessionStorage.setItem("userId",res.data.data.id);
          sessionStorage.setItem("userName",res.data.data.uname);
          this.$messagebox("信息", "注册成功").then(action => {
            this.$router.push("/Home");
          });
        }else if(res.data.code==0){
          this.$messagebox("用户名重复");  
        }
      });
    },
    dl() {
      this.$router.push("/Login");
    }
  }
};
</script>
