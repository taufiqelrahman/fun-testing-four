<template>
  <div class="flex -mx-4">
    <div class="w-1/2 px-4">
      <panel class="mt-4">
        <template slot="header">
          <div class="font-semibold">Test Case Execution - {{ test.title }}</div>
        </template>
        <div class="px-6 py-4">
          <div class="mb-4">
            <pie-chart
              :data="[['Passed', 44], ['Failed', 23], ['Blocked', 6]]" 
              height="180px"
              :colors="['#38c172', '#e3342f', '#b8c2cc']"></pie-chart>
          </div>
          <template v-for="item in test.scenarios">
            <div
              :key="item.id"
              :class="{'bg-blue-lighter': selectedScenario && item.id === selectedScenario.id}"
              class="flex justify-between py-2 items-center hover:bg-blue-lightest px-4 cursor-pointer"
              @click="selectTest(item)"
              >
              <div>{{ item.name }}</div>
              <tag :type="item.status" />
            </div>
          </template>
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
            <h4>{{ selectedScenario.name }}</h4>
            <hr class="border-solid border-t border-grey-light mt-4" />
            <div class="pt-3 pb-2 font-semibold">Preconditions</div>
            <div class="text-sm leading-normal">
              Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.
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
                  class="p-2">{{ item.text }}</div>
              </label>
            </div>
            <div class="flex h-24 text-sm">
              <div class="w-1/2 p-3 border border-solid border-grey-lighter">
                <tag :type="0" />
                <div class="my-1">{{ new Date() }}</div>
                <div>Username</div>
              </div>
              <div class="w-1/2 p-3 border border-solid border-grey-lighter">
                Remarks
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
      test: {
        title: 'Wew',
        scenarios: [
          {
            id: 0,
            name: 'Scenario 1',
            status: 0,
          },
          {
            id: 1,
            name: 'Scenario 2',
            status: 1,
          },
          {
            id: 2,
            name: 'Scenario 3',
            status: 2,
          },
        ]
      },
      selectedScenario: null,
      remark: null,
      assign: null,
      assignOpts: [
        {
          value: 0,
          text: 'Passed',
          bg: 'bg-green text-white',
        },
        {
          value: 2,
          text: 'Blocked',
          bg: 'bg-grey',
        },
        {
          value: 1,
          text: 'Failed',
          bg: 'bg-red text-white',
        },
      ]
    }
  },
  methods: {
    selectTest(item) {
      this.selectedScenario = item
    },
  },
  beforeMount() {
    
  }
}
</script>

<style>

</style>
