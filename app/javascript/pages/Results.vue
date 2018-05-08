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
              <option v-for="item in squads" :key="item.id" :value="item.id">{{ item.name }}</option>
            </select>
          </div>
        </template>
        <div class="px-6 py-4">
          <v-client-table ref="myTable" :data="features" :columns="columns" :options="options">
            <template slot="action" slot-scope="props">
              <i class="zmdi zmdi-run cursor-pointer text-xl hover:text-blue-dark" @click="run(props.row)"></i>
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
      feature: '',
      selectedFeature: null,
      isForm: false,
      scenarioName: '',
      scenarioSteps: [{
        value: '',
      }],
      columns: ['id', 'title', 'action'],
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
  computed: {
    squads() {
      return this.$store.state.data.squads
    },
    features() {
      return this.$store.state.data.features
    },
  },
  components: {
    Panel,
  },
  methods: {
    run(item) {
      if (item.last_report) {
        this.$store.dispatch('getFeatureReport', item.last_report.id)
          .then(res => {
            if (res) this.$router.push(`/results/${item.last_report.id}`)
          })
        return
      }
      this.$store.dispatch('generateFeatureReport', item.id)
        .then(res => {
          if (res) this.$router.push(`/results/${res}`)
        })
    },
    selectClass(model) {
      let newClass = 'text-sm font-medium p-3 h-8 border border-solid border-grey-light bg-white ml-3'
      if (this[model] === '') {
        newClass += ' text-grey-light'
      }
      return newClass
    },
    selectSquad() {
      this.$store.dispatch('getFeatures', this.squad)
    },
  },
  beforeMount() {
    this.$store.dispatch('getSquads')
    this.$store.commit('SET_DATA', { type: 'features', data: [] })
  }
}
</script>
