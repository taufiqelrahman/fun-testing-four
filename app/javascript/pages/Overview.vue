<template>
  <div>
    <!-- <h3 class="font-bold">Dashboard</h3> -->
    <div class="flex -mx-4">
      <div class="w-2/3 px-4">
        <panel class="mt-4">
          <template slot="header">
            <h4>Squad Summary</h4>
          </template>
          <template slot="actions">
            <select
              :class="selectClass('squad')"
              name="squad"
              v-model="squad"
              @change="selectSquad"
            >
              <option disabled value=''>Pilih squadmu</option>
              <option v-for="item in squads" :key="item.id" :value="item.id">{{ item.name }}</option>
            </select>
          </template>
          <div class="px-6 py-4">
            <pie-chart
              :data="[['Passed', 44], ['Failed', 23], ['Blocked', 6]]" 
              height="285px"
              :colors="['#38c172', '#e3342f', '#b8c2cc']"></pie-chart>
          </div>
        </panel>
      </div>
      <div class="w-1/3 px-4">
        <panel class="mt-4">
          <div @click="navigate('/results')" class="h-48 items-center flex flex-col justify-center hover:bg-blue-dark cursor-pointer text-white bg-blue">
            <h4>Run Tests</h4>
            <i class="zmdi zmdi-check-all text-5xl mt-3"></i>
          </div>
        </panel>
        <panel class="mt-4">
          <div @click="navigate('/cases')" class="h-48 items-center flex flex-col justify-center hover:bg-green-dark cursor-pointer text-white bg-green">
            <h4>Manage Tests</h4>
            <i class="zmdi zmdi-wrench text-5xl mt-3"></i>
          </div>
        </panel>
      </div>
    </div>
    <panel class="mt-4">
      <div class="p-4">
        logs..
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
      squad: 1,
    }
  },
  computed: {
    squads() {
      return this.$store.state.data.squads
    },
  },
  methods: {
    navigate(path) {
      this.$router.push(path)
    },
    selectClass(model) {
      let newClass = 'text-sm font-medium p-3 h-8 border border-solid border-grey-light bg-white ml-3'
      if (this[model] === '') {
        newClass += ' text-grey-light'
      }
      return newClass
    },
    selectSquad() {
      // this.$store.dispatch('getFeatures', this.squad)
    },
  },
  beforeMount() {
    this.$store.dispatch('getSquads')
  },
}
</script>
