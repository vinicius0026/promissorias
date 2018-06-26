import format from 'date-fns/format'

export default {
  methods: {
    formatDate(date, _format = 'DD/MM/YYYY') {
      return format(date, _format)
    },
    formatCurrency(amount = 0) {
      const numericAmount = Number(amount)
      return numericAmount.toLocaleString('pt-BR', {
        style: 'currency',
        currency: 'BRL'
      })
    }
  }
}
