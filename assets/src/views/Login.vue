<template lang="pug">
  v-content
    v-container(fluid fill-height)
      v-layout(align-center justify-center)
        v-flex(xs12 sm8)
          v-form(@submit.prevent="doLogin")
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
                  :error-messages="errorMessages($v.email)"
                  @input="$v.email.$touch()"
                  @blur="$v.email.$touch()"
                )
                v-text-field(
                  prepend-icon="lock"
                  v-model="password"
                  label="Senha"
                  type="password"
                  required
                  :error-messages="errorMessages($v.password)"
                  @input="$v.password.$touch()"
                  @blur="$v.password.$touch()"
                )

              v-card-actions
                v-spacer
                v-btn(@click="clear") Limpar
                v-btn(@click.prevent="doLogin" type="submit" :disabled="$v.$invalid") Login
</template>

<script>
import { mapActions } from 'vuex'
import snack from '../util/snack'
import { validationMixin } from 'vuelidate'
import { required, email } from 'vuelidate/lib/validators'
import errorMessages from '../mixins/errorMessages'

export default {
  mixins: [validationMixin, errorMessages],
  data() {
    return {
      email: '',
      password: ''
    }
  },
  validations() {
    return {
      email: {
        required,
        email
      },
      password: {
        required
      }
    }
  },
  methods: {
    ...mapActions(['login']),
    async doLogin() {
      this.$v.$touch()

      try {
        await this.login({ email: this.email, password: this.password })
      } catch (err) {
        snack.error('Email ou senha incorretos')
      }
    },
    clear() {
      this.$v.$reset()
      this.email = ''
      this.password = ''
    }
  }
}
</script>
