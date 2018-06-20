import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/views/Home'
import Reports from '@/views/Reports'
import Users from '@/views/Users'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Home
    },
    {
      name: 'Reports',
      path: '/reports',
      component: Reports
    },
    {
      name: 'Users',
      path: '/users',
      component: Users
    }
  ]
})
