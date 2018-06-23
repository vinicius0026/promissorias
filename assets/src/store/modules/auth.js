import { login, logout } from '../../services/auth'
import router from '@/router'

const state = {
  user: null
}

const getters = {
  isAuthenticated: state => !!state.user,
  isAdmin: state => (state.user && state.user.credential.is_admin) || false
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
  },
  clearUser(state) {
    state.user = null
    try {
      window.localStorage.removeItem('user')
    } catch (err) {
      console.warn(`error removing user from local storage ${err}`)
    }
  }
}

const actions = {
  async login({ commit }, { email, password }) {
    const { user } = await login(email, password)
    commit('setUser', user)
  },
  async logout({ commit }) {
    try {
      await logout()
      router.push({ name: 'Home' })
    } catch (err) {
      console.warn(`error logging out ${err}`)
    } finally {
      commit('clearUser')
    }
  }
}

export default {
  state,
  getters,
  mutations,
  actions
}
