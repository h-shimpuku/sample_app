<template>
  <div>
    <button @click="clickBtn">Click!</button>
    <p> Click Cnt: {{ clickCnt }}</p>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';

export default {
  props: {},
  data: function () {
    return {
    }
  },
  computed: {
    ...mapGetters({
      clickCnt: 'gClickCnt'
    })
  },
  created: function () {},
  mounted: function () {},
  methods: {
    ...mapActions({
      clickBtn: 'aClickCnt'
    })
  }
}
</script>
