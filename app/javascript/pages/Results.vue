<template>
  <div>
    <h3 class="font-bold">Test Runs & Results</h3>
    <div>
      <panel class="mt-4">
        <template slot="header">
          <div class="font-semibold">Activities</div>
        </template>
        <div class="px-6 py-4">
          <v-client-table ref="myTable" :data="tableData" :columns="columns" :options="options">
            <template slot="action" slot-scope="props">
              <i class="zmdi zmdi-run cursor-pointer" @click="run"></i>
            </template>
          </v-client-table>
        </div>
      </panel>
    </div>
  </div>
</template>

<script>
import Panel from 'components/Panel'
export default {
  name: 'Results',
  data() {
    return {
      columns: ['no', 'title', 'action'],
      tableData: [
	      { no: 1,
	      	title: 'wew',
	      },
	      { no: 2,
	      	title: 'uhuy',
	      },
	      { no: 3,
	      	title: 'wkwk',
	      },
      ],
      options: {
        preserveState: true,
				filterable: false,
				filterByColumn: false,
				// filterable:['type', 'status', 'payment'],
        skin: 'w-full table',
        // sortIcon: {
        // 	base:'fa',
        // 	up:'fa-sort-up',
        // 	down:'fa-sort-down',
        // 	is:'fa-sort' 
        // },
			},
    }
  },
  components: {
    Panel,
  },
  methods: {
    run() {
      this.$router.push(`/results/1`)
    },
  },
}
</script>
