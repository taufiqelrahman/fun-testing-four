<template>
  <panel class="mt-4">
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
        v-model="item.title"
        :key="index" type="text"
        class="border border-solid border-grey-light p-2 text-sm w-full my-3" />
    </template>
    <div @click="addStep" class="hover:text-blue-dark cursor-pointer mb-4">Add step</div>
    <button
      class="bg-blue-light hover:bg-blue text-white font-semibold hover:text-white py-2 px-4 border border-blue-light hover:border-transparent rounded"
      @click.prevent="submit">
      Save
    </button>
    <button
      class="bg-red-light hover:bg-red text-white font-semibold hover:text-white py-2 px-4 border border-red-light hover:border-transparent rounded"
      @click.prevent="toggleForm">
      Cancel
    </button>
    </div>
  </panel>
</template>

<script>
import Panel from 'components/Panel'
export default {
  name: 'ScenarioForm',
  components: {
    Panel,
  },
  props: {
    scenario: {
      required: false,
    },
    featureId: {
      required: false,
    },
  },
  data() {
    return {
      scenarioName: '',
      scenarioSteps: [{
        title: '',
      }],
    }
  },
  methods: {
    addStep() {
      this.scenarioSteps.push({ title: '' })
    },
    toggleForm() {
      this.$emit('toggleForm')
    },
    submit() {
      const steps = this.scenarioSteps.map(item => item.title)
      if (this.scenario) {
        this.$store.dispatch('editScenario', {
          title: this.scenarioName,
          steps: steps,
          id: this.scenario.id,
        }).then(res => {
          if (res) {
            this.$emit('toggleForm')
            this.$store.dispatch('getScenarios', this.featureId)
          }
        })
      }
      this.$store.dispatch('createScenario', {
          title: this.scenarioName,
          steps: steps,
          id: this.featureId,
        }).then(res => {
          if (res) {
            this.$emit('toggleForm')
            this.$store.dispatch('getScenarios', this.featureId)
          }
        })
    },
  },
  mounted() {
    if (this.scenario) {
      this.scenarioName = this.scenario.title
      this.scenarioSteps = Object.assign([], this.scenario.steps)
    }
  }
}
</script>

<style>

</style>
