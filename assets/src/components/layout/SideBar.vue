<template lang="pug">
  v-navigation-drawer(
    fixed
    app
    :value="showSideBar"
    @input="setSideBar"
    :clipped="$vuetify.breakpoint.mdAndUp"
  )
    v-list
      template(v-for="item in items")
        side-bar-item(:icon="item.icon" :label="item.label")
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
      items: [{ icon: 'people', label: 'Usuários' }]
    }
  },
  computed: {
    ...mapGetters(['showSideBar'])
  },
  methods: {
    ...mapMutations(['setSideBar'])
  }
}
</script>
