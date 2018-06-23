import axios from 'axios'

export const loadUsers = async () => {
  const { data } = await axios.get('/api/users')
  return data
}

export const removeUser = id => {
  return axios.delete(`/api/users/${id}`)
}
