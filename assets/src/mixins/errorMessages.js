export default {
  methods: {
    hasError(field, k) {
      return field[k] === false
    },
    errorMessages(field) {
      if (!field.$dirty) {
        return []
      }

      const errorMessageTable = {
        required: 'Campo Obrigatório',
        email: 'Email Inválido'
      }

      return Object.keys(errorMessageTable)
        .map(error => ({
          error,
          hasError: this.hasError(field, error)
        }))
        .filter(error => error.hasError)
        .map(({ error }) => errorMessageTable[error])
    }
  }
}
