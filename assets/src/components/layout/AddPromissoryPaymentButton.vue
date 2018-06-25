<template lang="pug">
  v-speed-dial.add-promissory-payment-button(
    v-model="isOpen"
    bottom
    right
    direction="top"
    open-on-hover
    transition="slide-y-reverse-transition"
  )
    v-btn(
      slot="activator"
      v-model="isOpen"
      color="red"
      dark
      fab
      large
    )
      v-icon add
      v-icon close
    v-tooltip(left)
      v-btn(
        slot="activator"
        fab
        dark
        color="primary"
        @click="openNewPromissoryModal"
      )
        v-icon add
      span Nova Promissória
    v-tooltip(left)
      v-btn(
        slot="activator"
        fab
        dark
        color="green"
      )
        v-icon attach_money
      span Receber Pagamento
</template>

<script>
import { mapMutations } from 'vuex'

export default {
  data() {
    return {
      isOpen: false
    }
  },
  methods: {
    ...mapMutations(['setNewPromissoryModalVisibility']),
    openNewPromissoryModal() {
      this.setNewPromissoryModalVisibility(true)
    }
  }
}
</script>

<style lang="stylus" scoped>
.add-promissory-payment-button
  position absolute
</style>
