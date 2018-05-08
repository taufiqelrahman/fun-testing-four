<template>
  <div>
    <h3 class="font-bold">Test Suites & Cases</h3>
    <div class="flex -mx-4">
      <div class="w-1/2 px-4">
        <panel class="mt-4">
          <div class="px-6 py-4">
            <div class="mb-4">
              <div>What is your squad?</div>
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
            <div class="mb-4">
              <div>Choose your feature</div>
              <select
                :class="selectClass('feature')"
                name="feature"
                v-model="feature"
                @change="selectFeature"
              >
                <option disabled value=''>Pilih featurenya</option>
                <option v-if="features" v-for="item in features" :key="item.id" :value="item.id">{{ item.title }}</option>
              </select>
            </div>
          </div>
        </panel>
      </div>
      <div class="w-1/2 px-4">
        <scenario-form v-if="isForm" @toggleForm="toggleForm" :scenario="scenarioToEdit"/>
        <panel v-else class="mt-4">
          <template slot="header">
            <div class="font-semibold">Feature Details</div>
          </template>
          <template slot="actions">
            <div>
              <button
                v-if="selectedFeature"
                class="bg-red-light hover:bg-red text-white font-semibold hover:text-white py-1 px-3 border border-red-light hover:border-transparent rounded"
                @click.prevent="deleteFeature(selectedFeature.id)">
                <i class="zmdi zmdi-delete text-sm"></i>
              </button>
            </div>
          </template>
          <div v-if="selectedFeature" class="px-6 py-4">
            <div class="py-1">Squad Name: {{ getSquadName }}</div>
            <div class="py-1">Feature Name: {{ selectedFeature.title }}</div>
            <div class="my-4">
              <template v-for="item in scenarios">
                <div
                  :key="item.id"
                  class="cursor-pointer">
                  <div class="flex justify-between items-center border-b border-solid border-grey-light py-1 hover:bg-blue-lighter">
                    <div>{{ item.title }}</div>
                    <div>
                      <button
                        class="bg-blue-light hover:bg-blue text-white font-semibold hover:text-white py-1 px-3 border border-blue-light hover:border-transparent rounded"
                        @click.prevent="editScenario(item)">
                        <i class="zmdi zmdi-edit text-sm"></i>
                      </button>
                      <button
                        class="bg-red-light hover:bg-red text-white font-semibold hover:text-white py-1 px-3 border border-red-light hover:border-transparent rounded"
                        @click.prevent="deleteScenario(item.id)">
                        <i class="zmdi zmdi-delete text-sm"></i>
                      </button>
                    </div>
                  </div>
                  <div v-if="item.id === showScenario" class="border border-solid border-grey-light border-t-0 p-3">
                    <div v-for="(step, index) in item.steps" :key="index" class="py-1">
                      Step {{ index + 1 }}: {{ step.title }}
                    </div>
                  </div>
                </div>
              </template>
            </div>
            <button
              class="bg-blue-light hover:bg-blue text-white font-semibold hover:text-white py-2 px-4 border border-blue-light hover:border-transparent rounded"
              @click.prevent="toggleForm">
              Add Scenario
            </button>
          </div>
          <div v-else class="px-6 py-4">
            Please select your squad and feature
          </div>
        </panel>
      </div>
    </div>
  </div>
</template>

<script>
import Panel from 'components/Panel'
import ScenarioForm from 'components/ScenarioForm'
export default {
  name: 'Cases',
  components: {
    Panel,
    ScenarioForm
  },
  data() {
    return {
      // squadOpts: [
      //   {
      //     id: 0,
      //     description: 'CSI',
      //     features: [
      //       {
      //         id: 0,
      //         description: 'Fitur 1',
      //       },
      //       {
      //         id: 1,
      //         description: 'Fitur 2',
      //       },
      //     ]
      //   },
      //   {
      //     id: 1,
      //     description: 'WoW',
      //   },
      // ],
      squad: '',
      feature: '',
      selectedFeature: null,
      showScenario: null,
      isForm: false,
      scenarioToEdit: null,
      // scenarioName: '',
      // scenarioSteps: [{
      //   value: '',
      // }],
    }
  },
  computed: {
    // featureOpts() {
    //   if (this.squad === '') return []
    //   return this.squadOpts.find(item => item.id === 0).features
    // },
    squads() {
      return this.$store.state.data.squads
    },
    getSquadName() {
      return this.$store.state.data.squads.find(item => item.id === this.squad).name
    },
    features() {
      return this.$store.state.data.features
    },
    scenarios() {
      return this.$store.state.data.scenarios
    },
  },
  methods: {
    selectClass(model) {
      let newClass = 'w-full text-sm font-medium p-3 h-8 border border-solid border-grey-light bg-white mt-3'
      if (this[model] === '') {
        newClass += ' text-grey-light'
      }
      return newClass
    },
    selectSquad(e) {
      if (!e.isTrusted) return;
      this.$store.dispatch('getFeatures', this.squad)
      this.feature = ''
      this.isForm = false
    },
    selectFeature(e) {
      if (!e.isTrusted) return;
      this.selectedFeature = this.features.find(item => item.id === this.feature)
      this.$store.dispatch('getScenarios', this.feature)
      this.isForm = false
    },
    deleteFeature(id) {
      this.$store.dispatch('deleteFeature', id)
        .then(res => {
          if (res) {
            alert('delete feature success')
            this.$store.dispatch('getFeatures', this.squad)
            this.selectedFeature = null
            this.feature = ''
          }
        })
    },
    deleteScenario(id) {
      // let newScenarios = Object.assign([], this.selectedFeature.scenarios)
      // // newScenarios.slice
      // this.$set(this.selectedFeature, 'scenarios', newScenarios)
    },
    editScenario(item) {
      this.scenarioToEdit = item
      this.toggleForm()
    },
    toggleForm() {
      this.isForm = !this.isForm
    },
    // addStep() {
    //   this.scenarioSteps.push({ value: '' })
    // },
    toggleScenario(id) {
      if (this.showScenario === id) {
        this.showScenario = null
        return
      }
      this.showScenario = id
    }
  },
  beforeMount() {
    this.$store.dispatch('getSquads')
  }
}
</script>
