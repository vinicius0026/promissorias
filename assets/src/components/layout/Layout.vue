<template lang="pug">
  .layout
    side-bar
    top-bar
    v-content
      v-container(fluid)
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
