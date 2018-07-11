<template lang="pug">
  v-app#app
    layout(v-if="isAuthenticated")
      router-view
      new-promissory-modal
      print-promissory-modal
    login(v-else)
    snack
</template>

<script>
import { mapGetters, mapMutations } from 'vuex'
import Login from './views/Login'
import Layout from './components/layout/Layout.vue'
import Snack from './components/layout/Snack.vue'
import NewPromissoryModal from '@/components/modals/newPromissoryNote/NewPromissoryModal.vue'
import PrintPromissoryModal from '@/components/modals/printPromissoryNote/PrintPromissoryModal.vue'

export default {
  name: 'App',
  components: {
    Login,
    Layout,
    Snack,
    NewPromissoryModal,
    PrintPromissoryModal
  },
  computed: {
    ...mapGetters(['isAuthenticated'])
  },
  mounted() {
    this.loadUserFromLocalStorage()
  },
  methods: {
    ...mapMutations(['loadUserFromLocalStorage'])
  }
}
</script>
