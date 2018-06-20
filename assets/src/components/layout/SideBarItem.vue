<template lang="pug">
  v-list-tile(:to="{name: to}" exact)
    v-list-tile-action
      v-icon {{ icon }}
    v-list-tile-content
      v-list-tile-title {{ label }}
</template>

<script>
export default {
  props: {
    icon: {
      type: String,
      default: ''
    },
    label: {
      type: String,
      required: true
    },
    to: {
      type: String,
      required: true
    }
  }
}
</script>
