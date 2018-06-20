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
                  v-model="email"
                  label="Email"
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
              v-btn(@click="doLogin") Login
</template>

<script>
import { mapActions } from 'vuex'

export default {
  data() {
    return {
      email: '',
      password: ''
    }
  },
  methods: {
    ...mapActions(['login']),
    doLogin() {
      try {
        this.login({ email: this.email, password: this.password })
      } catch (err) {
        console.warn(err)
      }
    }
  }
}
</script>
