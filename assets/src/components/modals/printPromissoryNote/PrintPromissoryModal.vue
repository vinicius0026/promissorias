<template lang="pug">
  v-dialog(
    :value="showPrintPromissoryModal"
    @input="maybeClosePrintPromissoryModal"
    max-width="800px"
    persistent
  )
    v-card(v-if="showPrintPromissoryModal")
      v-card-text(ref="printTarget")
        template(v-for="(installment, i) in promissoryToPrint.installments")
          installment-print-view(
            :key="installment.id"
            :installment="installment"
            :promissory="promissoryToPrint"
            :promissory-count="promissoryToPrint.installments.length"
            :promissory-number="i + 1"
          )
      v-card-actions
        v-spacer
        v-btn(color="danger" @click="close")
          | Cancelar
        v-btn(color="primary" @click="print")
          | Imprimir
</template>

<script>
import InstallmentPrintView from '@/components/modals/printPromissoryNote/InstallmentPrintView.vue'
import { mapGetters, mapMutations } from 'vuex'

export default {
  name: 'PrintPromissoryModal',
  components: {
    InstallmentPrintView
  },
  computed: {
    ...mapGetters(['showPrintPromissoryModal', 'promissoryToPrint'])
  },
  methods: {
    ...mapMutations(['clearPromissoryToPrint']),
    maybeClosePrintPromissoryModal(show) {
      if (!show) {
        this.close()
      }
    },
    close() {
      this.clearPromissoryToPrint()
    },
    print() {
      console.log(this.$refs)
      this.$refs.printTarget.print()
    }
  }
}
</script>
