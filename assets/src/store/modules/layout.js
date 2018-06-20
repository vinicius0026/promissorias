const state = {
  showSideBar: true
}

const getters = {
  showSideBar: state => state.showSideBar
}

const mutations = {
  toggleSideBar(state) {
    state.showSideBar = !state.showSideBar
  },
  setSideBar(state, val) {
    state.showSideBar = val
  }
}

export default {
  state,
  getters,
  mutations
}
