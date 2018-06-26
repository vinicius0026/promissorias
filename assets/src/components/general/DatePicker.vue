<template lang="pug">
  v-menu(
    v-model="showPicker"
    :close-on-content-click="false"
    lazy
    transition="scale-transition"
    offset-y
    full-width
    max-width="290px"
    min-width="290px"
  )
    v-text-field(
      slot="activator"
      :label="label"
      prepend-icon="event"
      @blur="date = parseDate(dateFormatted)"
      :value="dateFormatted"
    )
    v-date-picker(
      v-model="date"
      no-title
      @input="showPicker = false"
    )
</template>

<script>
import formatters from '@/mixins/formatters'

export default {
  mixins: [formatters],
  props: {
    label: {
      type: String,
      default: 'Data'
    },
    value: {
      type: Date,
      default: new Date()
    }
  },
  data() {
    return {
      showPicker: false,
      date: null,
      dateFormatted: null
    }
  },
  watch: {
    date(val) {
      this.$emit('input', this.toDateObject(val))
    },
    value: {
      deep: true,
      immediate: true,
      handler(val) {
        this.dateFormatted = this.formatDate(val)
        this.date = this.formatDate(val, 'YYYY-MM-DD')
      }
    }
  },
  methods: {
    parseDate(date) {
      if (!date) {
        return null
      }
      const [day, month, year] = date.split('/')
      return `${year}-${month.padStart(2, '0')}-${day.padStart(2, '0')}`
    },
    toDateObject() {
      if (!this.date) {
        return null
      }
      const [year, month, day] = this.date.split('-')
      return new Date(year, month - 1, day)
    }
  }
}
</script>
