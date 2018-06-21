import axios from 'axios'

export const loadUsers = async () => {
  const { data } = await axios.get('/api/users')
  return data
}
