<template>
  <div :class="renderClass" class="text-capitalize py-2 w-20 text-sm text-center rounded">
    {{ type }}
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
        case 'passed':
          return 'bg-green text-white'
        case 'failed':
          return 'bg-red text-white'
        case 'pending':
        case 'blocked':
          return 'bg-grey-light'
        default:
          break;
      }
    },
    // renderText() {
    //   switch (this.type) {
    //     case 0:
    //       return 'Passed'
    //     case 1:
    //       return 'Failed'
    //     case 2:
    //       return 'Blocked'
    //     default:
    //       break;
    //   }
    // }
  }
}
</script>

<style>

</style>
