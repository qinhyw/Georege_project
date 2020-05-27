<template>
  <div>
    <div class="setAddress">
      <div class="newAddressBox">
        <div class="newAddressView">
          <label>收货人</label
          ><input
            type="text"
            maxlength="20"
            placeholder="请填写收货人姓名"
            v-model="pname"
          />
        </div>
        <div class="newAddressView">
          <label>性别</label>
          <div class="adress-label-box">
            <div
              :class="ageClass==agei?'adressLabel active':'adressLabel'"
              v-for="(uage, agei) in uages"
              :key="agei"
              @click="getage(agei)"
            >
              {{ uage }}
            </div>
          </div>
        </div>
        <div class="newAddressView">
          <label>国家</label>
          <div class="country">
            <span>中国</span>
          </div>
        </div>
        <div class="newAddressView">
          <label>区号</label>
          <div class="AreaCode">
            <span>中国大陆 +86</span>
          </div>
        </div>
        <div class="newAddressView">
          <label>手机号码</label
          ><input
            type="text"
            maxlength="11"
            placeholder="请填写收货人手机号"
            v-model="phone"
          />
        </div>
        <div class="newAddressView">
          <label>所在地区</label>
          <div class="city" @click="toggle">
            <span
              >{{ myAddressProvince }} {{ myAddressCity }}
              {{ myAddresscounty }} <i class="icon-ctrl"></i
            ></span>
          </div>
        </div>
        <div class="newAddressView">
          <label address>详细地址</label
          ><input
            type="text"
            placeholder="详细地址(列如门牌号等) "
            v-model="dz"
          />
        </div>
        <div class="newAddressView">
          <label>选择标签</label>
          <div class="adress-label-box">
            <div
              :class="activeClass==index?'adressLabel active':'adressLabel'"
              v-for="(label, index) in labels"
              :key="index"
              @click="getitem(index)"
            >
              {{ label }}
            </div>
          </div>
        </div>
        <div class="newAddressView">
          <label>取货方式</label>
          <div class="adress-pick-up">
            <div
              v-for="(pick, picki) in pickUps"
              :key="picki"
              :class="pickClass==picki?' iconColor':''"
              @click="getpick(picki)"
            >
              <i class="icon-checkmark"></i><span>{{ pick }}</span>
            </div>
          </div>
        </div>
      </div>
      <div class="newAddressBottom">
        <div class="sureAddress" @click="confirm">保存并使用</div>
        <div class="cancelAddAddress">删除收货地址</div>
      </div>
    </div>
    <div
      :class="alert==false?'am-picker-popup-container':'am-picker-popup-container hide'"
      v-show="alert"
    >
      <div class="am-picker-popup-mask"></div>
      <div class="am-picker-popup-wrap">
        <div class="am-picker-popup">
          <div class="am-picker-popup-header">
            <div class="header-left" @click="toggle">取消</div>
            <div class="header-right" @click="determine">确定</div>
          </div>
          <div class="am-picker">
            <mt-picker
              :slots="myAddressSlots"
              @change="onMyAddressChange"
            ></mt-picker>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  import myaddress from "./json/provinces";
  export default {
    data() {
      return {
        phone: "",
        dz: "",
        pname: "",
        alert: false,
        uages: ["女士", "男士"],
        labels: ["家", "学校", "公司"],
        pickUps: ["快递", "同城", "自提"],
        activeClass: -1,
        ageClass: 1,
        pickClass: -1,
        myAddressSlots: [
          //城市三级联动
          {
            flex: 1,
            defaultIndex: 1,
            values: Object.keys(myaddress),
            className: "slot1",
            textAlign: "center"
          },
          {
            divider: true,
            content: "-",
            className: "slot2"
          },
          {
            flex: 1,
            values: [],
            className: "slot3",
            textAlign: "center"
          },
          {
            divider: true,
            content: "-",
            className: "slot4"
          },
          {
            flex: 1,
            values: [],
            className: "slot5",
            textAlign: "center"
          }
        ],
        myAddressProvince: "省",
        myAddressCity: "市",
        myAddresscounty: "区/县",
        arr: []
      };
    },
    created() {
      var user_id = sessionStorage.getItem("user_id");
      var receier = sessionStorage.getItem("receier");
      var phone = sessionStorage.getItem("phone");
      var dz = sessionStorage.getItem("address");
      console.log(receier);
      this.user_id = user_id;
      this.pname = receier;
      this.phone = phone;
      console.log(dz);
      this.dz = dz;
    },
    methods: {
      confirm() {
        console.log(11);
        var p = this.phone;
        console.log(p);
        //验证
        var reg = /^1[3456789]\d{9}$/;
        if (!/^1[3456789]\d{9}$/.test(p)) {
          this.$messagebox("手机号码有误，请重填");
          return;
        }
        var p = this.pname;
        if (!p) {
          this.$messagebox("您的姓名没有错");
        }
        var url = "/address";
        this.dz = this.arr[0] + this.arr[1] + this.arr[2];
        var user_id = 1;
        sessionStorage.setItem("user_id", 1);
        var obj = {
          user_id: user_id,
          receier: this.pname,
          phone: this.phone,
          address: this.dz
        };
        console.log(obj);
        this.axios.get(url, { params: obj }).then(res => {
          console.log(res);
          if (res.data.code > 0) {
            console.log(res);
            this.$messagebox("保存成功").then(action => {
              this.$router.push("/Address");
            });
          }
        });
      },
      toggle() {
        this.alert = !this.alert;
      },
      onMyAddressChange(picker, values) {
        //城市三级联动
        if (myaddress[values[0]]) {
          picker.setSlotValues(1, Object.keys(myaddress[values[0]]));
          picker.setSlotValues(2, myaddress[values[0]][values[1]]);
          this.arr[0] = values[0];
          this.arr[1] = values[1];
          this.arr[2] = values[2];
        }
      },
      determine() {
        this.myAddressProvince = this.arr[0];
        this.myAddressCity = this.arr[1];
        this.myAddresscounty = this.arr[2];
        this.alert = false;
      },
      getitem(index) {
        this.activeClass = index;
      },
      getage(agei) {
        this.ageClass = agei;
      },
      getpick(picki) {
        this.pickClass = picki;
      }
    },
    mounted() {
      this.$nextTick(() => {
        //城市三级联动
        this.myAddressSlots[0].defaultIndex = 0;
      });
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
  input {
    outline: none;
    text-align: right;
    border: 0;
  }
  div,
  label,
  input,
  span {
    font-size: 14px;
  }
  .setAddress {
    height: 100vh;
    background: #f3f3f3;
  }
  .newAddressBox {
    background: #fff;
  }
  .newAddressBox,
  .newAddressBottom {
    padding: 5px 15px;
  }
  .newAddressView {
    height: 42px;
    display: flex;
    border-bottom: 1px solid #ccc;
    justify-content: space-between;
    align-content: center;
    color: #666;
  }
  .newAddressView:nth-child(9) {
    border-bottom: none;
  }
  .newAddressView label {
    line-height: 42px;
    white-space: nowrap;
  }
  .adress-label-box {
    display: flex;
    align-items: center;
  }
  .city,
  .country,
  .AreaCode {
    display: flex;
    align-items: center;
    overflow: hidden;
    white-space: nowrap;
  }
  .country,
  .AreaCode {
    color: #000;
  }
  .adressLabel {
    width: 50px;
    height: 25px;
    border: 1px solid #ccc;
    border-radius: 14px;
    text-align: center;
    line-height: 23px;
    margin-left: 10px;
  }
  .active {
    background: rgba(255, 113, 0, 0.2);
    color: #ff7100;
    border: 1px solid #ff7100;
  }
  .iconColor {
    color: #ff7100;
  }
  .icon-checkmark:before {
    font-family: "icomoon";
    content: "\e900";
  }
  .icon-ctrl::before {
    font-family: "icomoon";
    content: "\ea50";
    line-height: 0px;
  }
  .adress-pick-up {
    display: flex;
    align-items: center;
  }
  .adress-pick-up i {
    padding: 0 5px 0 15px;
    vertical-align: middle;
  }
  .newAddressBottom {
    display: flex;
    flex-wrap: wrap;
    padding: 20px 15px;
  }
  .sureAddress,
  .cancelAddAddress {
    width: 100%;
    height: 44px;
    background: rgb(255, 113, 0);
    text-align: center;
    color: #fff;
    line-height: 44px;
    border-radius: 3px;
  }
  .cancelAddAddress {
    background: #fff;
    margin: 15px 0 0;
    color: #000;
  }
  @keyframes transition {
    from {
      height: 0%;
    }
    to {
      height: 45%;
    }
  }
  .am-picker-popup-mask {
    background-color: rgba(0, 0, 0, 0.4);
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    z-index: 1;
  }
  .am-picker-popup-wrap {
    position: fixed;
    left: 0;
    bottom: 0;
    height: 45%;
    width: 100%;
    z-index: 2;
    background: #fff;
    animation: transition 0.2s;
  }
  .am-picker-popup-header {
    display: flex;
    justify-content: space-between;
    height: 20px;
    border-bottom: 1px solid #ddd;
    padding: 10px;
    color: #108ee9;
  }
</style>
