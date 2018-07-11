const state = {
  // TODO: remove this initial state
  promissoryToPrint: {
    amount: '1450',
    customer: {
      address: 'Rua 1099, 561 Goiânia-GO 74830-240',
      cpf: '42454149362',
      id: 5,
      name: 'Tomás Alves Silva',
      phone: '(62) 8860-5099'
    },
    id: 5,
    installments: [
      {
        amount: '483.3333333333333',
        barcode: '79b1a52e-6bec-4d5c-817c-edd7573e3bc6',
        due_date: '2018-08-04',
        id: 13,
        paid_amount: 0
      },
      {
        amount: '483.3333333333333',
        barcode: '45ae1378-2b2c-4d62-bf05-41db9e33d3bb',
        due_date: '2018-09-04',
        id: 14,
        paid_amount: 0
      },
      {
        amount: '483.3333333333333',
        barcode: 'fd867aaf-9b0b-4e5e-ba36-1e294c120222',
        due_date: '2018-10-04',
        id: 15,
        paid_amount: 0
      }
    ]
  }
}

const getters = {
  promissoryToPrint: state => state.promissoryToPrint,
  showPrintPromissoryModal: state => !!state.promissoryToPrint
}

const mutations = {
  setPromissoryToPrint(state, promissory) {
    state.promissoryToPrint = promissory
  },
  clearPromissoryToPrint(state) {
    state.promissoryToPrint = null
  }
}

export default {
  state,
  getters,
  mutations
}
