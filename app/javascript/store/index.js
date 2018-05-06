import Vue from 'vue'
import Vuex from 'vuex'
import { 
  ui, 
  user,
} from './states'
import { 
} from './getters'
import { 
} from './mutations'
import { 
} from './actions'

Vue.use(Vuex)

export default new Vuex.Store({
  strict: true,
  state: Object.assign({}, { 
    ui, 
    user, 
  }),
  getters: {},
  mutations: {},
  actions: {}
})
