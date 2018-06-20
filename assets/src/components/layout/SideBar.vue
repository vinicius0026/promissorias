<template lang="pug">
  v-navigation-drawer(
    fixed
    app
    v-model="showSideBar"
    :clipped="$vuetify.breakpoint.mdAndUp"
  )
    v-list(dense)
      template(v-for="item in items")
        side-bar-item(:icon="item.icon" :label="item.label")
</template>

<script>
import SideBarItem from './SideBarItem.vue'

export default {
  components: {
    SideBarItem
  },
  data() {
    return {
      showSideBar: true,
      items: [{ icon: 'people', label: 'Usuários' }]
    }
  }
}
</script>
