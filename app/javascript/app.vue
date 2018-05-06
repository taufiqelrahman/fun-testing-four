<template>
  <div id="app">
    <navbar />
    <router-view></router-view>
  </div>
</template>

<script>
import Navbar from 'components/Navbar'
export default {
  name: 'App',
  components: {
    Navbar,
  }
}
</script>

<style src="styles/tailwind.css"></style>
<style lang="scss" src="styles/application.scss"></style>
