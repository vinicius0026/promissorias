<template lang="pug">
  .users-view
    v-card
      v-card-title
        h3 Usuários
      v-card-text
        users-table
</template>

<script>
import UsersTable from '@/components/users/UsersTable.vue'
export default {
  components: {
    UsersTable
  }
}
</script>
