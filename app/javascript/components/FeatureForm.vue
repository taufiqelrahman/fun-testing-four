<template>
  
  <panel class="mt-4">
    <template slot="header">
      <div class="font-semibold">New Feature</div>
    </template>
    <div class="px-6 py-4">
      Name
      <input
        v-model="title"
        type="text"
        class="border border-solid border-grey-light p-2 text-sm w-full my-3"/>
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
  name: 'FeatureForm',
  components: {
    Panel,
  },
  props: {
    feature: {
      required: false,
    },
    squadId: {
      required: true,
    },
  },
  data() {
    return {
      title: '',
    }
  },
  methods: {
    toggleForm() {
      this.$emit('toggleForm')
    },
    submit() {
      if (this.feature) {
        this.$store.dispatch('editFeature', {
          title: this.title,
          id: this.feature.id,
        }).then(res => {
          if (res) {
            this.$emit('toggleForm')
          }
        })
      }
      this.$store.dispatch('createFeature', {
          title: this.title,
          id: this.squadId,
        }).then(res => {
          if (res) {
            this.$emit('toggleForm')
          }
        })
    },
  },
  mounted() {
    if (this.feature) {
      this.title = this.feature.title
    }
  }
}
</script>

<style>

</style>
