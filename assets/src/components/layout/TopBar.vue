<template lang="pug">
  v-toolbar(
    :clipped-left="$vuetify.breakpoint.mdAndUp"
    color="blue darken-3"
    dark
    app
    fixed
  )
    v-toolbar(
      :clipped-left="$vuetify.breakpoint.lgAndUp"
      color="blue darken-3"
      dark
      app
      fixed
    )
      v-toolbar-title.ml-0.pl-3(style="width: 300px")
        v-toolbar-side-icon(v-if="isAdmin" @click.stop="toggleSideBar")
        span.hidden-sm-and-down Promissórias
      v-btn(flat @click="openNewPromissoryModal")
        v-icon add
        | Nova Promissória
      v-btn(flat)
        v-icon attach_money
        | Receber Pagamento
      v-text-field.hidden-sm-and-down(
        flat
        solo-inverted
        prepend-icon="search"
        label="Pesquisar"
      )
      v-spacer
      v-menu(offset-y right)
        v-btn(icon slot="activator")
          v-icon account_circle
        v-list
          v-list-tile(@click="logout")
            v-list-tile-title Logout
</template>

<script>
import { mapMutations, mapActions, mapGetters } from 'vuex'

export default {
  computed: {
    ...mapGetters(['isAdmin'])
  },
  methods: {
    ...mapMutations(['toggleSideBar', 'setNewPromissoryModalVisibility']),
    ...mapActions(['logout']),
    openNewPromissoryModal() {
      this.setNewPromissoryModalVisibility(true)
    }
  }
}
</script>
