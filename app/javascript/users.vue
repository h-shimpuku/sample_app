<template>
  <div id="users">
    <h1>All users</h1>
    <div class="pagination">
      <paginate-links
        for="paginate-user"
        class="pagination justify-content-center"
        :limit="5"
        :show-step-links="true"
        :step-links="{
          next: 'Next →',
          prev: '← Previous',
        }"
        :classes="{
          'ul.paginate-links > li': 'page-item',
          'ul.paginate-links > li > a': 'page-link',
        }"
      ></paginate-links>
    </div>
    <paginate class="users" name="paginate-user" :list="this.userList" :per="30">
      <li v-for="user in paginated('paginate-user')" :key="user.id">
        <img :alt="user.name" class="gravatar" :src="generateGravaterUrl(user)">
        <a :href="`/users/${user.id}`">{{ user.name }}</a>
      </li>
    </paginate>
    
    <div class="pagination">
      <paginate-links
        for="paginate-user"
        class="pagination justify-content-center"
        :limit="5"
        :show-step-links="true"
        :step-links="{
          next: 'Next →',
          prev: '← Previous',
        }"
        :classes="{
          'ul.paginate-links > li': 'page-item',
          'ul.paginate-links > li > a': 'page-link',
        }"
      ></paginate-links>
    </div>
    <Button/>
    {{ clickCntText }}
  </div>
</template>

<script>

import axios from 'axios';
import { mapGetters } from 'vuex';
import Button from './components/Button.vue';

export default {
  components: {
    Button
  },
  props: {
    iconSize: {
      default: '50'
    }
  },
  data: function () {
    return {
      userList: [],
      paginate: ['paginate-user'],
      crypto: require('crypto')
    }
  },
  computed: {
    ...mapGetters([
      'clickCntText'
    ])
  },
  created: function () {
    axios.get('/api/v1/users')
      .then(response => {
        if (response.status === 200) {
          this.userList = response.data;
        }
      })
  },
  mounted: function () {
  },
  methods: {
    generateGravaterUrl(user) {
      //md5ハッシュを作る関数を作成
      const md5hex = str => this.crypto.createHash('md5').update(str, 'binary').digest('hex');
      const gravatarId = md5hex(user.email.toLowerCase());
      const gravatarUrl = `https://secure.gravatar.com/avatar/${gravatarId}?s=${this.iconSize}`;
      return gravatarUrl;
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
