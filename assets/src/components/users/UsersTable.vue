<template lang="pug">
  v-data-table(
    :headers="headers"
    :items="users"
    :search="search"
    :loading="loading"
  )
    template(slot="items" slot-scope="props")
      td {{ props.item.name }}
      td {{ props.item.username }}
      td {{ props.item.credential && props.item.credential.email }}
      td {{ props.item.credential && props.item.credential.is_admin }}
      td
        v-btn(icon)
          v-icon delete
</template>

<script>
import { loadUsers } from '@/services/users'
import snack from '@/util/snack'

export default {
  data() {
    return {
      search: '',
      users: [],
      loading: false,
      headers: [
        {
          text: 'Nome',
          align: 'left',
          sortable: true,
          value: 'name'
        },
        {
          text: 'Nome de Usuário',
          align: 'left',
          sortable: true,
          value: 'username'
        },
        {
          text: 'Email',
          align: 'left',
          sortable: true,
          value: 'credential.email'
        },
        {
          text: 'Admin',
          align: 'left',
          sortable: true,
          value: 'credential.is_admin'
        },
        {
          text: '',
          sortable: false
        }
      ]
    }
  },
  mounted() {
    this.doLoadUsers()
  },
  methods: {
    async doLoadUsers() {
      this.loading = true
      try {
        const { users } = await loadUsers()
        this.users = users
      } catch (err) {
        snack.error('Erro ao carregar usuários')
        console.warn(err)
      } finally {
        this.loading = false
      }
    }
  }
}
</script>
