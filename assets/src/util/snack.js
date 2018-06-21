/**
 * Small helper to show snack messages
 */

import store from '../store'

const showMessage = (message, mode) =>
  store.commit('showSnackMessage', { message, mode })

const success = message => showMessage(message, 'success')
const info = message => showMessage(message, 'info')
const error = message => showMessage(message, 'error')
const warning = message => showMessage(message, 'warning')

export default {
  success,
  info,
  warning,
  error,
  showMessage
}
