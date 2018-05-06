<template>
  <div class="c-navbar shadow">
    <div class="container mx-auto flex flex-row items-center h-16">
      <div class="mr-4">
        <h3>funtestingfour</h3>
      </div>
      <ul class="list-reset flex flex-row">
        <li v-for="(menu, index) in menus" :key="index" class="mx-4">
          {{ menu }}
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
      menus: ['Overview', 'Test Results', 'Test Cases'],
    }
  }
}
</script>

<style>

</style>
