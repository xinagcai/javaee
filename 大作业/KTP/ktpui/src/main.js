import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import SlideVerify from 'vue-monoplasty-slide-verify'
import VueCookies from 'vue-cookies'
import axios from 'axios'



Vue.use(ElementUI)
Vue.use(SlideVerify)
Vue.use(VueCookies)

// 设置cookie
Vue.$cookies.config('2d')

Date.prototype.format = function(fmt) {
  var o = {
    "M+" : this.getMonth()+1,
    "d+" : this.getDate(),
    "h+" : this.getHours(),
    "m+" : this.getMinutes(),
    "s+" : this.getSeconds(),
    "q+" : Math.floor((this.getMonth()+3)/3),
    "S"  : this.getMilliseconds()
  };
  if(/(y+)/.test(fmt)) {
    fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
  }
  for(var k in o) {
    if(new RegExp("("+ k +")").test(fmt)){
      fmt = fmt.replace(RegExp.$1, (RegExp.$1.length===1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
    }
  }
  return fmt;
}

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')


axios.interceptors.request.use(
  config => {
   config.headers['token']=store.state.token
    return config
  },function(error){
    return Promise.reject(error)
  }
)
// token 过期，重定向到登录页面
axios.interceptors.response.use(function (response) {
  if (response.data.state == false){
    sessionStorage.clear()
    router.replace({
      path: '/',
    })
  }
  return response
}, function (error) {
  // Do something with response error
  return Promise.reject(error)
})
