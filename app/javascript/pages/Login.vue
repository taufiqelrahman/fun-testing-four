<template>
  <div class="w-1/3 mx-auto text-sm">
    <h4 class="mb-4 text-center">Login please..</h4>
    <div class="py-1">
      Email
      <input
        v-model="email"
        type="text"
        class="border border-solid border-grey-light p-2 text-sm w-full my-3"/>
    </div>
    <div class="py-1">
      Password
      <input
        v-model="password"
        type="password"
        class="border border-solid border-grey-light p-2 text-sm w-full my-3"/>
    </div>
    <button
      class="w-full mt-2 bg-transparent hover:bg-blue text-blue-dark font-semibold hover:text-white py-2 px-4 border border-blue hover:border-transparent rounded"
      @click.prevent="logIn">
      Login
    </button>
  </div>
</template>

<script>
// import { mapActions	} from 'vuex'
export default {
  name: 'Login',
  data() {
    return {
      email: '',
      password: '',
    }
  },
  methods: {
    // ...mapActions([
    //   'logIn',
    // ]),
    logIn() {
      this.$store.dispatch('logIn', {
        email: this.email,
        password: this.password,
      })
    }
  },
}
</script>

<style>

</style>
