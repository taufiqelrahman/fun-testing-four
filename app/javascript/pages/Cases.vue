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
                <option v-for="item in squadOpts" :key="item.id" :value="item.id">{{ item.description }}</option>
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
                <option disabled value=''>Pilih squadmu</option>
                <option v-if="featureOpts" v-for="item in featureOpts" :key="item.id" :value="item.id">{{ item.description }}</option>
              </select>
            </div>
          </div>
        </panel>
      </div>
      <div class="w-1/2 px-4">
        <panel v-if="isForm" class="mt-4">
          <template slot="header">
            <div class="font-semibold">New Scenario</div>
          </template>
          <div class="px-6 py-4">
          Name
          <input
            v-model="scenarioName"
            type="text"
            class="border border-solid border-grey-light p-2 text-sm w-full my-3"/>
          <template v-for="(item, index) in scenarioSteps">
            Step {{ index + 1 }}
            <input
              v-model="item.value"
              :key="index" type="text"
              class="border border-solid border-grey-light p-2 text-sm w-full my-3" />
          </template>
          <div @click="addStep" class="hover:text-blue-dark cursor-pointer mb-4">Add step</div>
          <button
            class="bg-blue-light hover:bg-blue text-white font-semibold hover:text-white py-2 px-4 border border-blue-light hover:border-transparent rounded"
            @click.prevent="toggleForm">
            Save
          </button>
          </div>
        </panel>
        <panel v-else class="mt-4">
          <template slot="header">
            <div class="font-semibold">Feature Details</div>
          </template>
          <div v-if="selectedFeature" class="px-6 py-4">
            <div class="py-1">Squad Name: {{ selectedFeature.squad }}</div>
            <div class="py-1">Feature Name: {{ selectedFeature.description }}</div>
            <div class="my-4">
              <template v-for="item in selectedFeature.scenarios">
                <div
                  :key="item.id"
                  @click="toggleScenario(item.id)"
                  class="cursor-pointer">
                  <div class="flex justify-between items-center border-b border-solid border-grey-light py-1 hover:bg-blue-lighter">
                    <div>{{ item.name }}</div>
                    <button
                      class="bg-red-light hover:bg-red text-white font-semibold hover:text-white py-2 px-4 border border-red-light hover:border-transparent rounded"
                      @click.prevent="deleteScenario(item.id)">
                      Delete
                    </button>
                  </div>
                  <div v-if="item.show" class="border border-solid border-grey-light border-t-0 p-3">
                    <div v-for="(step, index) in item.steps" :key="index" class="py-1">
                      Step {{ index + 1 }}: {{ step }}
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
export default {
  name: 'Cases',
  components: {
    Panel,
  },
  data() {
    return {
      squadOpts: [
        {
          id: 0,
          description: 'CSI',
          features: [
            {
              id: 0,
              description: 'Fitur 1',
            },
            {
              id: 1,
              description: 'Fitur 2',
            },
          ]
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
    }
  },
  computed: {
    featureOpts() {
      if (this.squad === '') return []
      return this.squadOpts.find(item => item.id === 0).features
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
      this.feature = ''
    },
    selectFeature(e) {
      if (!e.isTrusted) return;
      this.selectedFeature = {
        id: 0,
        description: 'Fitur 1',
        squad: 'CSI',
        scenarios: [
          {
            id: 0,
            name: 'Make sure to turn on.',
            show: false,
            steps: [
              'test',
              'test again',
            ]
          },
          {
            id: 1,
            name: 'Make sure to turn off.',
            show: false,
            steps: [
              'test 1',
              'test not again',
            ]
          },
        ]
      }
    },
    deleteScenario(id) {
      // let newScenarios = Object.assign([], this.selectedFeature.scenarios)
      // // newScenarios.slice
      // this.$set(this.selectedFeature, 'scenarios', newScenarios)
    },
    toggleForm() {
      this.isForm = !this.isForm
    },
    addStep() {
      this.scenarioSteps.push({ value: '' })
    },
    toggleScenario(id) {
      let newScenario = this.selectedFeature.scenarios.find(item => item.id === id)
      this.$set(newScenario, 'show', !newScenario.show)
    }
  },
}
</script>
