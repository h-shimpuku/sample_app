import Vue from 'vue/dist/vue.esm'
import Users from '../users.vue'
import Paginate from 'vue-paginate'
import store from '../store';

Vue.use(Paginate);

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#users',
    store,
    components: { Users }
  })
})

