<template>
  <div class="shadow bg-white">
    <div v-if="$slots['header']" class="border-b border-solid border-grey-light">
      <div class="flex px-6 py-6">
        <div :class="$slots['actions'] ? 'w-1/2' : 'w-full'">
          <slot name="header" />
        </div>
        <div v-if="$slots['actions']" class="w-1/2 float-right">
          <slot name="actions" />
        </div>
      </div>
    </div>
    <slot />
  </div>
</template>

<script>
export default {
  name: 'Panel',
}
</script>

<style>

</style>
