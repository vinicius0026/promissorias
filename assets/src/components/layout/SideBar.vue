<template lang="pug">
  v-navigation-drawer(
    fixed
    app
    :value="isAdmin && showSideBar"
    @input="setSideBar"
    :clipped="$vuetify.breakpoint.mdAndUp"
  )
    v-list
      template(v-for="item in items")
        side-bar-item(:icon="item.icon" :label="item.label" :to="item.to")
</template>

<script>
import SideBarItem from './SideBarItem.vue'
import { mapGetters, mapMutations } from 'vuex'

export default {
  components: {
    SideBarItem
  },
  data() {
    return {
      items: [
        { icon: 'dashboard', label: 'Principal', to: 'Home' },
        { icon: 'description', label: 'Relatórios', to: 'Reports' },
        { icon: 'people', label: 'Usuários', to: 'Users' }
      ]
    }
  },
  computed: {
    ...mapGetters(['showSideBar', 'isAdmin'])
  },
  methods: {
    ...mapMutations(['setSideBar'])
  }
}
</script>
