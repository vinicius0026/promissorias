import axios from 'axios'
import store from '../store'

axios.interceptors.response.use(
  res => res,
  err => {
    if (err.response.status === 401 && store.getters.isAuthenticated) {
      store.dispatch('logout')
    }
    return Promise.reject(err)
  }
)

export const login = async (email, password) => {
  const { data } = await axios.post('/auth', { email, password })
  return data
}

export const logout = () => {
  return axios.delete('/auth')
}
