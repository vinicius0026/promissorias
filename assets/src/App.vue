<template>
  <div id="app">
    <router-view v-if="isAuthenticated"/>
    <Login v-else />
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import Login from './views/Login'

export default {
  name: 'App',
  components: {
    Login
  },
  computed: {
    ...mapGetters(['isAuthenticated'])
  }
}
</script>
