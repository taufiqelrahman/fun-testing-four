<template>
  <div>
    <h3 class="font-bold">Overview</h3>
    <panel class="mt-4">
      <template slot="header">
        <h4>Activity</h4>
      </template>
      <template slot="actions">
        <!-- Activity -->
      </template>
      <div class="px-6 py-4">
        <line-chart :data="data" :colors="['#FC2525', '#05CBE1']" />
      </div>
    </panel>
  </div>
</template>

<script>
import Panel from 'components/Panel'
export default {
  name: 'Overview',
  components: {
    Panel,
  },
  data() {
    return {
      data: [
        {name: 'Workout', data: {'2017-01-01 00:00:00 -0800': 3, '2017-01-02 00:00:00 -0800': 4}},
        {name: 'Call parents', data: {'2017-01-01 00:00:00 -0800': 5, '2017-01-02 00:00:00 -0800': 3}}
      ],
    }
  }
}
</script>
