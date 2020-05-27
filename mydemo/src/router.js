import Vue from "vue";
import Router from "vue-router";
import HelloContainer from "./components/HelloWorld.vue";
import Login from "./components/music/Login.vue";
import Home from "./components/music/Home.vue";
import Reg from "./components/music/Reg.vue";
import Cart from "./components/music/Cart.vue";
import Cart1 from "./components/music/Cart1.vue";
import Details from "./components/music/Details";
import Address from "./components/music/Address.vue";
import Setaddress from "./components/music/Setaddress.vue";
import Mdetail from "./components/music/Mdetail.vue";
import musiclist from "./components/music/Musiclist.vue";
import Musicstyle from "./components/music/Musicstyle.vue";
import Radio from "./components/music/Radio.vue";
import Video from "./components/music/Video.vue";
import topq from "./components/music//common/topq.vue";
import qyy from "./components/music//common/qyy.vue";
Vue.use(Router);
export default new Router({
  routes: [
    { path: "/qyy", component: qyy },
    { path: "/topq", component: topq },
    { path: "/Video", component: Video },
    { path: "/Radio", component: Radio },
    { path: "/Musicstyle", component: Musicstyle },
    { path: "/Musiclist", component: musiclist },
    { path: "/Mdetail/:id", component: Mdetail, props: true },
    { path: "/Address", component: Address },
    { path: "/Setaddress", component: Setaddress },
    { path: "/Details/:id", component: Details, props: true },
    { path: "/Cart1", component: Cart1 },
    { path: "/Cart", component: Cart },
    { path: "/Home", component: Home },
    { path: "/Reg", component: Reg },
    { path: "/Login", component: Login },
    { path: "/", component: HelloContainer }
  ]
});
