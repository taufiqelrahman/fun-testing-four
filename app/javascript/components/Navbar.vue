<template>
  <div class="c-navbar shadow text-grey-darker fixed w-full bg-white">
    <div class="container mx-auto flex flex-row items-center h-16">
      <div class="mr-8">
        <h3 class="text-blue-dark hover:text-blue cursor-pointer" @click="navigate('/')">funtestingfour</h3>
      </div>
      <ul class="list-reset flex flex-row">
        <li
          v-for="(menu, index) in menus"
          :key="index"
          :class="{'font-semibold': isActive(menu.path)}"
          class="w-32 text-center hover:text-blue-dark cursor-pointer"
          @click="navigate(menu.path)">
          {{ menu.name }}
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Navbar',
  data() {
    return {
      menus: [
        {
          path: '/',
          name: 'Overview',
        },
        { 
          path: '/results',
          name: 'Test Results',
        },
        { 
          path: '/cases',
          name: 'Test Cases',
        },
      ],
    }
  },
  methods: {
    navigate(path) {
      this.$router.push(path)
    },
    isActive(path) {
      return this.$route.path === path
    },
  },
}
</script>

<style lang="scss" scoped>
</style>
