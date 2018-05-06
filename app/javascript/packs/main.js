
import Vue from 'vue'
import Vuex from 'vuex'
import VeeValidate from 'vee-validate'
import VueRouter from 'vue-router'
import App from 'App'
import router from 'router'
import store from 'store'

Vue.use(VueRouter)
Vue.use(Vuex)
Vue.use(VeeValidate)

document.addEventListener('DOMContentLoaded', () => {
  var app = new Vue({
    el: '#app',
    store,
    router,
    render: h => h(App)
  })
})
