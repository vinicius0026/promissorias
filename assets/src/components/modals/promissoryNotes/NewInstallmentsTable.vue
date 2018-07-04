<template lang="pug">
  v-data-table(
    :headers="headers"
    :items="installments"
    hide-actions
    v-if="amount && installmentsCount"
  )
    template(slot="items" slot-scope="props")
      td {{ props.item.installmentNumber }}
      td(style="width: 220px")
        date-picker(
          label="Vencimento"
          v-model="props.item.due_date"
        )
      td.text-xs-right {{ formatCurrency(props.item.amount) }}
</template>

<script>
import DatePicker from '@/components/general/DatePicker.vue'
import addMonths from 'date-fns/add_months'
import formatters from '@/mixins/formatters'

export default {
  components: {
    DatePicker
  },
  mixins: [formatters],
  props: {
    amount: {
      type: Number,
      default: 0
    },
    installmentsCount: {
      type: Number,
      default: 0
    }
  },
  data() {
    return {
      headers: [
        {
          text: 'Parcela',
          align: 'left',
          sortable: false
        },
        {
          text: 'Vencimento',
          align: 'left',
          sortable: false,
          value: 'due_date'
        },
        {
          text: 'Valor',
          align: 'right',
          sortable: false,
          value: 'amount'
        }
      ],
      installments: []
    }
  },
  watch: {
    amount(val) {
      this.generateInstallments(val, this.installmentsCount)
    },
    installmentsCount(val) {
      this.generateInstallments(this.amount, val)
    },
    installments(val) {
      this.$emit('update', val)
    }
  },
  methods: {
    generateInstallments(amount, installmentsCount) {
      if (!amount || !installmentsCount) {
        return
      }

      this.installments = [...Array(installmentsCount).keys()].map(i => ({
        installmentNumber: i + 1,
        amount: amount / installmentsCount,
        due_date: addMonths(new Date(), i + 1)
      }))
    }
  }
}
</script>
