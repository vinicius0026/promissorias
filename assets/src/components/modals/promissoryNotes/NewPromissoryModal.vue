<template lang="pug">
  v-dialog(
    :value="showNewPromissoryModal"
    @input="setNewPromissoryModalVisibility"
    max-width="500px"
    persistent
  )
    v-form(@submit.prevent="submit")
      v-card.pa-2
          v-card-title
            h3 Nova Promissória
          v-card-text
            v-layout(row)
              v-flex(xs12)
                v-text-field(
                  v-model="customer.name"
                  name="name"
                  label="Nome"
                  required
                )
            v-layout(row)
              v-flex.mr-1(xs12 sm6)
                v-text-field(
                  v-model="customer.cpf"
                  name="cpf"
                  label="CPF"
                  required
                )
              v-flex.ml-1(xs12 sm6)
                v-text-field(
                  v-model="customer.phone"
                  name="phone"
                  label="Telefone"
                  required
                )
            v-layout(row)
              v-flex(xs12)
                v-text-field(
                  v-model="customer.address"
                  name="address"
                  label="Endereço"
                  required
                )
          v-card-actions
            v-spacer
            v-btn(color="danger" @click="close")
              | Cancelar
            v-btn(color="primary" type="submit")
              | Criar
</template>

<script>
import { mapGetters, mapMutations } from 'vuex'

export default {
  data() {
    return {
      customer: {},
      promissory: {}
    }
  },
  computed: {
    ...mapGetters(['showNewPromissoryModal'])
  },
  methods: {
    ...mapMutations(['setNewPromissoryModalVisibility']),
    close() {
      this.setNewPromissoryModalVisibility(false)
    },
    submit() {
      console.log('submit')
    }
  }
}
</script>
