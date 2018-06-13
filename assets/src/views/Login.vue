<template lang="pug">
  .login-view
    v-container
      v-layout
        v-flex(xs12 sm6 offset-sm3)
          v-card
            v-card-title(primary-title)
              div
                h3.headline.mb-0 Login

            v-card-text
              v-form(ref="form")
                v-text-field(
                  v-model="username"
                  label="Nome de usuário"
                  required
                )
                v-text-field(
                  v-model="password"
                  label="Senha"
                  type="password"
                )

            v-card-actions
              v-spacer
              v-btn Limpar
              v-btn Login
</template>

<script>
export default {
  data () {
    return {
      username: '',
      password: ''
    }
  }
}
</script>
