<template lang="pug">
  v-app#app
    layout(v-if="isAuthenticated")
      router-view
    login(v-else)
</template>

<script>
import { mapGetters } from 'vuex'
import Login from './views/Login'
import Layout from './components/layout/Layout.vue'

export default {
  name: 'App',
  components: {
    Login,
    Layout
  },
  computed: {
    ...mapGetters(['isAuthenticated'])
  }
}
</script>
