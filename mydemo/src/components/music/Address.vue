<template>
  <div>
    <div class="myAddress">
      <div class="get-wechat-address" @click="Obtain">
        <div><i class="icon-wechat"></i><span>获取微信收货地址</span></div>
        <i class="icon-ctrl"></i>
      </div>
      <div class="my-address" v-for="(item,i) of address" :key="i">
        <div class="myAddress-address">
          <div class="myAddress-address-top">
            <label class="adressLabel school">学校</label
            ><span class="address-person"
              >{{ item.receier }}(uage) {{ item.phone }}</span
            >
          </div>
          <span class="address-detail">{{ item.address }}</span>
        </div>
        <i class="icon-pencil" @click="set(i)"></i>
      </div>
    </div>
    <div class="myAddress-bottom-nav" @click="add">
      新增收货地址
    </div>
  </div>
</template>
<script>
  export default {
    data() {
      return {
        address: []
      };
    },
    created() {
      this.load();
    },
    methods: {
      Obtain() {
        this.$toast("除微信里面，其他地方暂时不支持导入");
      },
      set(i) {
        var user_id = this.address[i].user_id;
        var receier = this.address[i].receier;
        console.log(receier);
        var phone = this.address[i].phone;
        var address = this.address[i].address;
        console.log(address);
        sessionStorage.setItem("user_id", user_id);
        sessionStorage.setItem("receier", receier);
        sessionStorage.setItem("phone", phone);
        sessionStorage.setItem("address", address);
        this.$router.push("./Setaddress");
      },
      add() {
        
        this.$router.push("/Setaddress");
      },
      load() {
        var url = "/ress";
        var user_id = sessionStorage.getItem("user_id");
        console.log(user_id);
        var obj = { user_id: user_id };
        this.axios.get(url, { params: obj }).then(res => {
          this.address = res.data.data;
        });
      }
    }
  };
</script>
<style scoped>
  @font-face {
    font-family: "icomoon";
    src: url("fonts/icomoon.eot?q0tv6r");
    src: url("fonts/icomoon.eot?q0tv6r#iefix") format("embedded-opentype"),
      url("fonts/icomoon.ttf?q0tv6r") format("truetype"),
      url("fonts/icomoon.woff?q0tv6r") format("woff"),
      url("fonts/icomoon.svg?q0tv6r#icomoon") format("svg");
    font-weight: normal;
    font-style: normal;
  }
  i {
    font-style: normal;
  }
  .myAddress {
    padding: 0 15px;
    font-size: 13px;
    color: #666;
  }
  .get-wechat-address {
    height: 34.5px;
    margin-bottom: 7.5px;
    display: flex;
    justify-content: space-between;
    line-height: 34.5px;
  }
  .icon-wechat::before {
    font-family: "icomoon";
    content: "\e901";
    /* color: #5fc726; */
    margin-right: 5px;
  }
  .icon-ctrl::before {
    font-family: "icomoon";
    content: "\ea50";
  }
  .myAddress-address {
    width: 90%;
    padding: 13px 0;
    display: flex;
    flex-direction: column;
  }
  .my-address {
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid #f3f3f3;
  }

  .adressLabel {
    display: inline-block;
    width: 2rem;
    border: 1px solid #ccc;
    border-radius: 14px;
    text-align: center;
    line-height: 14px;
    font-size: 12px;
    margin-right: 5px;
  }
  .address-person {
    color: #000;
  }
  .address-detail {
    font-size: 13px;
    margin: 5px 0 0;
  }
  .icon-pencil {
    width: 10%;
    height: 38px;
    border-left: 1px solid #f3f3f3;
    text-align: center;
    line-height: 38px;
  }
  .icon-pencil::before {
    font-family: "icomoon";
    content: "\e905";
  }
  .myAddress-bottom-nav {
    height: 47px;
    width: 100%;
    background: rgb(255, 113, 0);
    color: #fff;
    position: fixed;
    bottom: 0;
    text-align: center;
    line-height: 47px;
    margin: 0;
    padding: 0;
  }
  .school {
    background: #f1fbea;
    color: #79dc31;
    border: 1px solid #79dc31;
  }
  .home {
    background: #ffefe2;
    color: #ff7100;
    border: 1px solid #ff7100;
  }
  .company {
    background: #eaf4fe;
    color: #3091f2;
    border: 1px solid #3091f2;
  }
</style>
