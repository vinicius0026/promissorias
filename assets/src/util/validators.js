import withParams from 'vuelidate/lib/withParams'
import { email, required, minLength, maxLength } from 'vuelidate/lib/validators'
import { isValid as isValidCpf } from '@fnando/cpf'

const cpf = withParams({ type: 'cpf' }, isValidCpf)

export { email, required, cpf, minLength, maxLength }
