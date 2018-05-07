<template>
  <div>
    <h3 class="font-bold">Test Suites & Cases</h3>
    <panel class="mt-4">
      <template slot="header">
        <h4>Edit Test Case</h4>
      </template>
      <div class="px-6 py-4">
        form
      </div>
    </panel>
  </div>
</template>

<script>
import Panel from 'components/Panel'
export default {
  name: 'Cases',
  components: {
    Panel,
  }
}
</script>
