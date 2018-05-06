import Vue from 'vue'
import Router from 'vue-router'
// import Root from '@/layouts/Root'

// import PathNotFound from '@/pages/PathNotFound'
import Overview from 'pages/Overview'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Overview',
      component: Overview,
    },
  ]
})
