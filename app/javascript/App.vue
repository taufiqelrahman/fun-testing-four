<template>
  <div id="app" class="font-sans">
    <navbar />
    <div class="bg-grey-app-bg">
      <div class="container mx-auto py-8 text-grey-darkest pt-22">
        <router-view></router-view>
      </div>
    </div>
  </div>
</template>

<script>
import Navbar from 'components/Navbar'
export default {
  name: 'App',
  components: {
    Navbar,
  },
  methods: {
    ...mapActions([
      'getUser',
    ]),
  },
  beforeMount() {
    if (this.$store.state.ui.isLoggedIn) this.$store.dispatch('getUser')
  }
}
</script>

<style src="styles/tailwind.css"></style>
<style lang="scss" src="styles/application.scss"></style>
