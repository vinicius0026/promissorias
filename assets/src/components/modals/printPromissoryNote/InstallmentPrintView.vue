<template lang="pug">
  .installment-print-view
    .installment-print-view__number
      | Nº {{ installment.id }}
    .installment-print-view__barcode
      | {{ installment.barcode }}
    .installment-print-view__amount
      | {{ formatCurrency(installment.amount) }}
    .installment-print-view__due-date
      | {{ formatDate(installment.due_date) }}
    .installment-print-view__main-text.full-width
      | Em {{ formatDateLong(installment.due_date) }}
      | pagarei por esta única via de Nota Promissória
      | a Auto Escola Transytar CNPJ: xxxxxxxxxx ou à sua ordem
      | a quantia de {{ formatCurrency(installment.amount) }}
      | em moeda corrente deste país
    .installment-print-view__city
      | Pagável em Palhoça / SC
    .installment-print-view__issue_date
      | Data da Emissão: xxxxx
    .installment-print-view__issuer
      | Emitente {{ promissory.customer.name }}
    .installment-print-view__cpf
      | CPF {{ promissory.customer.cpf }}
    .installment-print-view__address
      | Endereço {{ promissory.customer.address }}
    .installment-print-view__signature.full-width
      | Assinatura do Emitente ____________________________________

</template>

<script>
import formatters from '@/mixins/formatters'

export default {
  mixins: [formatters],
  props: {
    installment: {
      type: Object,
      required: true
    },
    promissory: {
      type: Object,
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
  grid-template-rows repeat(6, 1fr)

  .full-width
    grid-column 1 / -1
</style>
