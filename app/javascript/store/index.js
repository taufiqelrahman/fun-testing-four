import Vue from 'vue'
import Vuex from 'vuex'
import { 
  ui, 
  user,
} from './states'
import { 
} from './getters'
import { 
  uiMutations,
} from './mutations'
import { 
  uiActions,
} from './actions'

Vue.use(Vuex)

export default new Vuex.Store({
  strict: true,
  state: Object.assign({}, { 
    ui, 
    user, 
  }),
  getters: {},
  mutations: Object.assign({},
    uiMutations,
  ),
  actions: Object.assign({},
    uiActions,
  ),
})
