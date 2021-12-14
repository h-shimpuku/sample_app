import Vue from "vue/dist/vue.esm";
import Vuex from "vuex"

Vue.use(Vuex);

// 学習のため区別しやすいように'mClickCnt'とか'aClickCnt'とか接頭辞付けてるけど、そんなルールはない
export default new Vuex.Store({
  state: {
    clickCnt: 0
  },
  getters: {
    gClickCnt: state => state.clickCnt,
    clickCntText: state => `現在のクリック数は${state.clickCnt}です。`,
  },
  mutations: {
    mClickCnt (state) {
      state.clickCnt++;
    }
  },
  actions: {
    aClickCnt ({commit}) {
      commit('mClickCnt');
    }
  }
})