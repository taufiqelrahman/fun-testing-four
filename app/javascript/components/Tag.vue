<template>
  <div :class="renderClass" class="py-2 w-20 text-sm text-center rounded">
    {{ renderText }}
  </div>
</template>

<script>
export default {
  name: 'Tag',
  props: {
    type: {
      required: true,
    }
  },
  computed: {
    renderClass() {
      switch (this.type) {
        case 0:
          return 'bg-green text-white'
        case 1:
          return 'bg-red text-white'
        case 2:
          return 'bg-grey-light'
        default:
          break;
      }
    },
    renderText() {
      switch (this.type) {
        case 0:
          return 'Passed'
        case 1:
          return 'Failed'
        case 2:
          return 'Blocked'
        default:
          break;
      }
    }
  }
}
</script>

<style>

</style>
