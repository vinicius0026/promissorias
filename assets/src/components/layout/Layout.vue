<template lang="pug">
  .layout
    top-bar
    side-bar
    v-content
      v-container(fluid fill-height)
        slot
</template>

<script>
import TopBar from './TopBar.vue'
import SideBar from './SideBar.vue'

export default {
  components: {
    SideBar,
    TopBar
  }
}
</script>
