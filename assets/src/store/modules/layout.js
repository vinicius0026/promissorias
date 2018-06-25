const state = {
  showSideBar: true,
  snackMessage: {},
  showNewPromissoryModal: false
}

const getters = {
  showSideBar: state => state.showSideBar,
  snackMessage: state => state.snackMessage,
  shouldShowSnackMessage: state => !!state.snackMessage.message,
  showNewPromissoryModal: state => state.showNewPromissoryModal
}

const mutations = {
  toggleSideBar(state) {
    state.showSideBar = !state.showSideBar
  },
  setSideBar(state, val) {
    state.showSideBar = val
  },
  showSnackMessage(state, { message, mode = 'info', timeout = 5000 }) {
    state.snackMessage = {
      message,
      mode,
      timeout,
      timestamp: new Date().toISOString() // this is sent to trigger watcher on snack message
    }
  },
  hideSnackMessage(state) {
    state.snackMessage = {}
  },
  setNewPromissoryModalVisibility(state, visibility) {
    state.showNewPromissoryModal = visibility
  }
}

export default {
  state,
  getters,
  mutations
}
