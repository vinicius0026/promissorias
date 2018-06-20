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
    try {
      window.localStorage.setItem('user', JSON.stringify(user))
    } catch (err) {
      console.warn(`error setting user to local storage: ${err}`)
    }
  },
  loadUserFromLocalStorage(state) {
    try {
      const user = JSON.parse(window.localStorage.getItem('user'))
      state.user = user
    } catch (err) {
      console.warn(`error loading user from local storage: ${err}`)
      state.user = null
    }
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
