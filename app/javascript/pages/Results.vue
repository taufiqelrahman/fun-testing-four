<template>
  <div>
    <h3 class="font-bold">Test Runs & Results</h3>
    <div class="flex -mx-4">
      <div class="w-1/2 px-4">
        <panel class="mt-4">
          <template slot="header">
            <div class="font-semibold">Document Editing</div>
          </template>
          <div class="px-6 py-4">
            form
          </div>
        </panel>
      </div>
      <div class="w-1/2 px-4">
        <panel class="mt-4">
          <template slot="header">
            <div class="font-semibold">Verify CSV Import</div>
          </template>
          <div class="px-6 py-4">
            form
          </div>
        </panel>
      </div>
    </div>
  </div>
</template>

<script>
import Panel from 'components/Panel'
export default {
  name: 'Results',
  components: {
    Panel,
  }
}
</script>
