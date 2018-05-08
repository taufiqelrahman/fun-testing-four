<template>
  <div class="flex -mx-4">
    <div class="w-1/2 px-4">
      <panel class="mt-4">
        <template slot="header">
          <div v-if="feature" class="font-semibold text-capitalize">Test Case Execution - {{ feature.feature.title }}</div>
        </template>
        <div class="px-6 py-4">
          <div class="mb-4">
            <pie-chart
              :data="[['Passed', passed], ['Failed', failed], ['Blocked', blocked]]" 
              height="180px"
              :colors="['#38c172', '#e3342f', '#b8c2cc']"></pie-chart>
          </div>
          <div v-if="scenarios.length > 0">
            <template v-for="item in scenarios">
              <div
                :key="item.id"
                :class="{'bg-blue-lighter': selectedScenario && item.id === selectedScenario.id}"
                class="flex justify-between py-2 items-center hover:bg-blue-lightest px-4 cursor-pointer"
                @click="selectTest(item)"
                >
                <div>{{ item.scenario.title }}</div>
                <tag :type="item.state" />
              </div>
            </template>
          </div>
          <div v-else>
            No scenarios yet
          </div>
        </div>
      </panel>
    </div>
    <div class="w-1/2 px-4">
      <panel class="mt-4">
        <template slot="header">
          <div class="font-semibold">Test Case Execution</div>
        </template>
        <div class="px-6 py-4">
          <div v-if="selectedScenario">
            <h4>{{ selectedScenario.scenario.title }}</h4>
            <hr class="border-solid border-t border-grey-light mt-4" />
            <div class="pt-3 pb-2 font-semibold">Preconditions</div>
            <div class="text-sm leading-normal">
              {{ selectedScenario.scenario.description }}
            </div>
            <hr class="border-solid border-t border-grey-light mt-4" />
            <div class="pt-3 pb-2 font-semibold">Test Steps</div>
            <div v-if="steps.length > 0" v-for="(item, index) in steps" :key="item.step_id" class="py-1">
              {{ index + 1 }}. {{ item.step.title }}
            </div>
            <hr class="border-solid border-t border-grey-light mt-3" />
            <div class="pt-3 pb-2 font-semibold">Remarks :</div>
            <textarea
              v-model="remark"
              class="w-full border border-solid border-grey-light text-sm p-2"
              rows="2" />
            <div class="flex my-3">
              <label v-for="item in assignOpts" :key="item.value" class="cursor-pointer w-1/3 text-sm text-center">
                <input
                  v-model="assign"
                  :value="item.value"
                  class="hidden"
                  name="assign"
                  type="radio">
                <div
                  :class="assign === item.value ? item.bg : 'bg-grey-lighter'"
                  class="p-2 text-capitalize">{{ item.value }}</div>
              </label>
            </div>
            <div class="flex h-24 text-sm">
              <div class="w-1/2 p-3 border border-solid border-grey-lighter">
                <tag :type="selectedScenario.state" />
                <div class="my-1">{{ selectedScenario.updated_at }}</div>
                <div>{{ selectedScenario.user.username }}</div>
              </div>
              <div class="w-1/2 p-3 border border-solid border-grey-lighter">
                Remarks:
                {{ selectedScenario.description }}
              </div>
            </div>
          </div>
          <div v-else>
            Please select a scenario
          </div>
        </div>
      </panel>
    </div>
  </div>
</template>

<script>
import Panel from 'components/Panel'
import Tag from 'components/Tag'
export default {
  name: 'ResultDetail',
  components: {
    Panel,
    Tag,
  },
  props: {
    id: {
      required: true,
    },
  },
  data() {
    return {
      // test: {
      //   title: 'Wew',
      //   scenarios: [
      //     {
      //       id: 0,
      //       name: 'Scenario 1',
      //       status: 0,
      //     },
      //     {
      //       id: 1,
      //       name: 'Scenario 2',
      //       status: 1,
      //     },
      //     {
      //       id: 2,
      //       name: 'Scenario 3',
      //       status: 2,
      //     },
      //   ]
      // },
      scenarioId: null,
      remark: null,
      assign: null,
      assignOpts: [
        {
          value: 'passed',
          bg: 'bg-green text-white',
        },
        {
          value: 'blocked',
          bg: 'bg-grey',
        },
        {
          value: 'failed',
          bg: 'bg-red text-white',
        },
      ]
    }
  },
  watch: {
    assign(val) {
      if (val) this.updateTest();
    },
  },
  computed: {
    scenarios() {
      return this.$store.state.data.scenarioReport
    },
    selectedScenario() {
      return this.scenarios.find(item => item.id === this.scenarioId)
    },
    passed() {
      return this.scenarios.filter(item => item.state === 'passed').length
    },
    failed() {
      return this.scenarios.filter(item => item.state === 'failed').length
    },
    blocked() {
      return this.scenarios.filter(item => item.state === 'blocked').length
    },
    steps() {
      return this.$store.state.data.steps
    },
    feature() {
      return this.$store.state.data.feature
    },
  },
  methods: {
    selectTest(item) {
      this.scenarioId = item.id
      this.remark = null
      this.assign = null
      this.$store.dispatch('getSteps', this.selectedScenario.id)
    },
    updateTest() {
      this.$store.dispatch('updateReportScenario', {
        id: this.selectedScenario.id,
        state: this.assign,
        description: this.remark,
      }).then(res => {
        this.$store.dispatch('getFeatureReport', this.id)
      })
    }
  },
  beforeMount() {
    this.$store.dispatch('getFeatureReport', this.id)
  },
  mounted() {
    this.$store.dispatch('getFeatureFromReport', this.id)
  }
}
</script>

<style>

</style>
