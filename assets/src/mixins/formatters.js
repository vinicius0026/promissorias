import format from 'date-fns/format'
import pt from 'date-fns/locale/pt'

export default {
  methods: {
    formatDate(date, _format = 'DD/MM/YYYY') {
      return format(date, _format)
    },
    formatDateLong(date) {
      return format(date, 'D [de] MMMM [de] YYYY', { locale: pt })
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
