<template lang="pug">
  v-content
    v-container(fluid fill-height)
      v-layout(align-center justify-center)
        v-flex(xs12 sm8)
          v-form(@submit="doLogin")
            v-card.elevation-12
              v-toolbar(dark color="primary")
                v-toolbar-title Login
              v-card-text
                v-text-field(
                  prepend-icon="email"
                  type="email"
                  v-model="email"
                  name="email"
                  label="Email"
                  required
                )
                v-text-field(
                  prepend-icon="lock"
                  v-model="password"
                  label="Senha"
                  type="password"
                  required
                )

              v-card-actions
                v-spacer
                v-btn(@click="clear") Limpar
                v-btn(@click="doLogin" type="submit") Login
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
    },
    clear() {
      this.email = ''
      this.password = ''
    }
  }
}
</script>
