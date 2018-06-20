import { login } from '../../services/auth'

const state = {
  user: null
}

const getters = {
  isAuthenticated: state => !!state.user
}

const mutations = {
  setUser(state, user) {
    state.user = user
  }
}

const actions = {
  login: async ({ commit }, { email, password }) => {
    const { data } = await login(email, password)
    const { user } = data
    commit('setUser', user)
  }
}

export default {
  state,
  getters,
  mutations,
  actions
}
