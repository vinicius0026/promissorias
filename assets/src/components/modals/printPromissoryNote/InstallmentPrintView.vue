<template lang="pug">
  .installment-print-view
    barcode.installment-print-view__barcode(
      :value="installment.id"
      :width="2"
      :height="50"
      :margin="0"
      :font-size="15"
     )
    .installment-print-view__number
      | Nº
      span.user-data {{ promissoryNumber }} / {{ promissoryCount }}
    .installment-print-view__amount
      span.user-data {{ formatCurrency(installment.amount) }}
    .installment-print-view__due-date
      span.user-data {{ formatDate(installment.due_date) }}
    .installment-print-view__main-text.full-width
      | Em
      span.user-data {{ formatDateLong(installment.due_date) }}
      | pagarei por esta única via de Nota Promissória à
      span.user-data Auto Escola Transytar
      | CNPJ:
      span.user-data xxxxxxxxxx
      | ou à sua ordem a quantia de
      span.user-data {{ formatCurrency(installment.amount) }}
      | em moeda corrente deste país.
    .installment-print-view__city
      | Pagável em
      span.user-data Palhoça / SC
    .installment-print-view__issue_date
      | Data da Emissão:
      span.user-data xxxxx
    .installment-print-view__issuer.full-width
      | Emitente
      span.user-data {{ promissory.customer.name }}
    .installment-print-view__cpf
      | CPF
      span.user-data {{ formatCpf(promissory.customer.cpf) }}
    .installment-print-view__address
      | Endereço
      span.user-data {{ promissory.customer.address }}
    .installment-print-view__signature.full-width
      | Assinatura do Emitente ________________________________________________________

</template>

<script>
import formatters from '@/mixins/formatters'
import VueBarcode from 'vue-barcode'

export default {
  components: {
    barcode: VueBarcode
  },
  mixins: [formatters],
  props: {
    installment: {
      type: Object,
      required: true
    },
    promissory: {
      type: Object,
      required: true
    },
    promissoryNumber: {
      type: Number,
      required: true
    },
    promissoryCount: {
      type: Number,
      required: true
    }
  }
}
</script>

<style lang="stylus" scoped>
.installment-print-view
  border 1px solid #333
  margin-bottom 5px
  padding 5px
  display grid
  grid-template-columns repeat(4, 1fr)
  grid-template-rows repeat(6, auto)
  grid-gap 10px

  .full-width
    grid-column 1 / -1

  &__city
    grid-column 1 / span 2

  &__issue_date
    grid-column 3 / span 2

  &__address
    grid-column 2 / span 3

  &__signature
    padding-top 25px

  .user-data
    font-weight bold
    font-size 16px
    margin 0 10px
</style>
