import axios from 'axios'

export const createPromissoryNote = async (customer, promissory) => {
  const { data } = await axios.post('/api/promissory_notes', {
    customer,
    promissory
  })
  return data
}
