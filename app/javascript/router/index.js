import Vue from 'vue'
import Router from 'vue-router'

// import PathNotFound from '@/pages/PathNotFound'
import Login from 'pages/Login'
import Overview from 'pages/Overview'
import Results from 'pages/Results'
import Cases from 'pages/Cases'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Overview',
      component: Overview,
    },
    {
      path: '/login',
      name: 'Login',
      component: Login,
    },
    {
      path: '/results',
      name: 'Results',
      component: Results,
    },
    {
      path: '/cases',
      name: 'Cases',
      component: Cases,
    },
  ]
})
