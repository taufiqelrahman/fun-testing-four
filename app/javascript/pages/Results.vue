<template>
  <div>
    <h3 class="font-bold">Test Runs & Results</h3>
    <div>
      <panel class="mt-4">
        <template slot="header">
          <div class="w-full flex items-center">
            <div class="font-semibold">Features of</div>
            <select
              :class="selectClass('squad')"
              name="squad"
              v-model="squad"
              @change="selectSquad"
            >
              <option disabled value=''>Pilih squadmu</option>
              <option v-for="item in squadOpts" :key="item.id" :value="item.id">{{ item.description }}</option>
            </select>
          </div>
        </template>
        <div class="px-6 py-4">
          <v-client-table ref="myTable" :data="tableData" :columns="columns" :options="options">
            <template slot="action" slot-scope="props">
              <i class="zmdi zmdi-run cursor-pointer text-xl hover:text-blue-dark" @click="run"></i>
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
      squad: '',
      squadOpts: [
        {
          id: 0,
          description: 'CSI',
        },
        {
          id: 1,
          description: 'WoW',
        },
      ],
      squad: '',
      feature: '',
      selectedFeature: null,
      isForm: false,
      scenarioName: '',
      scenarioSteps: [{
        value: '',
      }],
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
        skin: 'w-full table mb-4',
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
    selectClass(model) {
      let newClass = 'text-sm font-medium p-3 h-8 border border-solid border-grey-light bg-white ml-3'
      if (this[model] === '') {
        newClass += ' text-grey-light'
      }
      return newClass
    },
    selectSquad() {

    },
  },
}
</script>
