<template lang="pug">
  v-snackbar(
    :value="shouldShowSnackMessage"
    @input="hideSnackMessage()"
    :color="snackMessage.mode"
    :timeout="0"
  )
    | {{ snackMessage.message }}
    v-btn(flat color="white" @click.native="hideSnackMessage" icon)
      v-icon close

</template>

<script>
import { mapGetters, mapMutations } from 'vuex'

export default {
  data() {
    return {
      timeoutId: null
    }
  },
  computed: {
    ...mapGetters(['shouldShowSnackMessage', 'snackMessage'])
  },
  watch: {
    snackMessage: {
      deep: true,
      handler({ timeout }) {
        if (this.timeoutId) {
          clearTimeout(this.timeoutId)
        }
        this.timeoutId = setTimeout(() => {
          this.hideSnackMessage()
        }, timeout)
      }
    }
  },
  methods: {
    ...mapMutations(['hideSnackMessage'])
  }
}
</script>
