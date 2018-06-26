<template lang="pug">
  v-dialog(
    :value="showNewPromissoryModal"
    @input="setNewPromissoryModalVisibility"
    max-width="800px"
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
            v-layout(row)
              v-flex.mr-1(xs12 sm6)
                v-text-field(
                  v-model="promissory.amount"
                  type="number"
                  name="amount"
                  label="Valor"
                  required
                )
              v-flex.ml1(xs12 sm6)
                v-text-field(
                  v-model="promissory.installmentsCount"
                  type="number"
                  name="installmentsCount"
                  label="Número de Parcelas"
                  required
                )
            v-layout(row)
              v-flex(xs12)
                new-installments-table(:amount="Number(promissory.amount)" :installmentsCount="Number(promissory.installmentsCount)")
          v-card-actions
            v-spacer
            v-btn(color="danger" @click="close")
              | Cancelar
            v-btn(color="primary" type="submit")
              | Criar
</template>

<script>
import { mapGetters, mapMutations } from 'vuex'
import NewInstallmentsTable from '@/components/modals/promissoryNotes/NewInstallmentsTable'

export default {
  components: {
    NewInstallmentsTable
  },
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
