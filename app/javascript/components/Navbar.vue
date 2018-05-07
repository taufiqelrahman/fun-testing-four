<template>
  <div class="shadow text-grey-darker fixed w-full bg-white">
    <div class="container mx-auto flex flex-row items-center h-16 justify-between">
      <div class="flex">
        <div class="mr-8">
          <h3 class="text-blue-dark hover:text-blue cursor-pointer" @click="navigate('/')">funtestingfour</h3>
        </div>
        <ul class="list-reset flex flex-row">
          <li
            v-for="(menu, index) in menus"
            :key="index"
            :class="{'font-semibold text-grey-darkest': isActive(menu.path)}"
            class="w-32 text-center hover:text-blue-dark cursor-pointer"
            @click="navigate(menu.path)">
            {{ menu.name }}
          </li>
        </ul>
      </div>
      <div
        v-if="isLoggedIn"
        class="flex items-center cursor-pointer relative px-4 h-16"
        @click="toggleUserMenu"
        v-on-clickaway="hideUserMenu">
        <div>Hello, <span class="text-blue-dark">John</span></div>
        <img :src="avatar" alt="avatar" class="rounded-full h-10 ml-4" />
        <div
          v-if="showUserMenu"
          class="absolute pin-l w-full bg-white shadow-md px-4 py-3"
          style="top: 4.2rem;">
          <ul class="list-reset">
            <li class="hover:text-blue-dark cursor-pointer text-sm py-2">Profile</li>
            <li class="hover:text-blue-dark cursor-pointer text-sm py-2" @click="logOut">Log Out</li>
          </ul>
        </div>
      </div>
      <div
        v-else
        @click="navigate('/login')"
        class="cursor-pointer hover:text-blue-dark h-16 flex items-center px-4">
        Log In
      </div>
    </div>
  </div>
</template>

<script>
import { mixin as clickaway } from 'vue-clickaway';
import { mapActions	} from 'vuex'
import avatar from 'assets/avatar.jpg'
export default {
  name: 'Navbar',
  mixins: [ clickaway ],
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
      avatar,
      showUserMenu: false,
    }
  },
  computed: {
    isLoggedIn() {
      return this.$store.state.ui.isLoggedIn
    },
  },
  methods: {
    ...mapActions([
      'logOut',
    ]),
    navigate(path) {
      this.$router.push(path)
    },
    isActive(path) {
      return this.$route.path === path
    },
    toggleUserMenu() {
      this.showUserMenu = !this.showUserMenu
    },
    hideUserMenu() {
      if (this.showUserMenu) this.showUserMenu = false
    },
  },
}
</script>

<style lang="scss" scoped>
</style>
