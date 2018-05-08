
import Vue from 'vue'
import Vuex from 'vuex'
import VeeValidate from 'vee-validate'
import VueRouter from 'vue-router'
import VueChartkick from 'vue-chartkick'
import { ServerTable, ClientTable, Event } from 'vue-tables-2'
import Chart from 'chart.js'
import App from 'App'
import router from 'router'
import store from 'store'

Vue.use(VueChartkick, { adapter: Chart })
Vue.use(VueRouter)
Vue.use(Vuex)
Vue.use(VeeValidate)
Vue.use(ClientTable)

router.beforeEach((to, from, next) => {
  const isLoggedIn = store.state.ui.isLoggedIn
  const loginPaths = ['Login']

  if (isLoggedIn) {
    if (loginPaths.indexOf(to.name) !== -1) {
      next('/')
      return
    }
    next()
  }
  else {
    if (loginPaths.indexOf(to.name) === -1) {
      // if (to.name === 'Login') {
      //   next()
      //   return
      // }
      next('/login')
      return
    }
    next()
  }
});

document.addEventListener('DOMContentLoaded', () => {
  var app = new Vue({
    el: '#app',
    store,
    router,
    render: h => h(App)
  })
})
