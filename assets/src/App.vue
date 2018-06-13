<template lang="pug">
  v-app#app
    router-view(v-if="isAuthenticated")
    Login(v-else)
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
