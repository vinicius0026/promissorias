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
                  :error-messages="errorMessages($v.customer.name)"
                  @blur="$v.customer.name.$touch()"
                )
            v-layout(row)
              v-flex.mr-1(xs12 sm6)
                v-text-field(
                  v-model="customer.cpf"
                  name="cpf"
                  label="CPF"
                  mask="###-###-###-##"
                  required
                  :error-messages="errorMessages($v.customer.cpf)"
                  @blur="$v.customer.cpf.$touch()"
                )
              v-flex.ml-1(xs12 sm6)
                v-text-field(
                  v-model="customer.phone"
                  name="phone"
                  label="Telefone"
                  v-mask="['(##) ####-####', '(##) #####-####']"
                  required
                  :error-messages="errorMessages($v.customer.phone)"
                  @blur="$v.customer.phone.$touch()"
                )
            v-layout(row)
              v-flex(xs12)
                v-text-field(
                  v-model="customer.address"
                  name="address"
                  label="Endereço"
                  required
                  :error-messages="errorMessages($v.customer.address)"
                  @blur="$v.customer.address.$touch()"
                )
            v-layout(row)
              v-flex.mr-1(xs12 sm6)
                v-text-field(
                  v-model="promissory.amount"
                  type="number"
                  name="amount"
                  label="Valor"
                  min="0"
                  required
                )
              v-flex.ml1(xs12 sm6)
                v-text-field(
                  v-model="promissory.installmentsCount"
                  type="number"
                  name="installmentsCount"
                  label="Número de Parcelas"
                  min="0"
                  max="5"
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
import { validationMixin } from 'vuelidate'
import { required, cpf, minLength, maxLength } from '@/util/validators'
import errorMessages from '@/mixins/errorMessages'
import NewInstallmentsTable from '@/components/modals/promissoryNotes/NewInstallmentsTable'
import { mask } from 'vue-the-mask'

export default {
  components: {
    NewInstallmentsTable
  },
  directives: { mask },
  mixins: [validationMixin, errorMessages],
  data() {
    return {
      customer: {},
      promissory: {}
    }
  },
  validations() {
    return {
      customer: {
        name: {
          required
        },
        cpf: {
          required,
          cpf
        },
        phone: {
          required,
          minLength: minLength(14),
          maxLength: maxLength(15)
        },
        address: {
          required
        }
      }
    }
  },
  computed: {
    ...mapGetters(['showNewPromissoryModal'])
  },
  methods: {
    ...mapMutations(['setNewPromissoryModalVisibility']),
    close() {
      this.customer = {}
      this.promissory = {}
      this.setNewPromissoryModalVisibility(false)
    },
    submit() {
      console.log('submit')
    }
  }
}
</script>
