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
  userMutations,
} from './mutations'
import { 
  uiActions,
  userActions,
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
    userMutations,
  ),
  actions: Object.assign({},
    uiActions,
    userActions,
  ),
})
