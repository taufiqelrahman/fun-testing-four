<template>
  <div>
    <h4>Login please..</h4>
    <button
      class="mt-4 bg-transparent hover:bg-blue text-blue-dark font-semibold hover:text-white py-2 px-4 border border-blue hover:border-transparent rounded"
      @click.prevent="logIn">
      Login
    </button>
  </div>
</template>

<script>
import { mapActions	} from 'vuex'
export default {
  name: 'Login',
  methods: {
    ...mapActions([
      'logIn',
    ]),
  },
}
</script>

<style>

</style>
