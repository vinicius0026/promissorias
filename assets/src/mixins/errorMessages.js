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
        email: 'Email Inválido',
        cpf: 'CPF Inválido',
        minLength: {
          message: 'Este campo deve ter ao menos {} caracteres',
          errorKey: 'minLength',
          paramKey: 'min'
        },
        maxLength: {
          message: 'Este campo deve ter no máximo {} caracteres',
          errorKey: 'maxLength',
          paramKey: 'max'
        }
      }

      return Object.keys(errorMessageTable)
        .map(error => ({
          error,
          hasError: this.hasError(field, error)
        }))
        .filter(error => error.hasError)
        .map(({ error }) => errorMessageTable[error] || 'Inválido')
        .map(messageObj => {
          if (typeof messageObj === 'string') {
            return messageObj
          }
          return messageObj.message.replace(
            '{}',
            field.$params[messageObj.errorKey][messageObj.paramKey]
          )
        })
    }
  }
}
