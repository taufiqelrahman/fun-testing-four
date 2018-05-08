import Vue from 'vue'
import Vuex from 'vuex'
import { 
  ui, 
  user,
  data,
} from './states'
import { 
} from './getters'
import { 
  uiMutations,
  userMutations,
  dataMutations,
} from './mutations'
import { 
  uiActions,
  userActions,
  dataActions,
} from './actions'

Vue.use(Vuex)

export default new Vuex.Store({
  // strict: true,
  state: Object.assign({}, { 
    ui, 
    user, 
    data,
  }),
  getters: {},
  mutations: Object.assign({},
    uiMutations,
    userMutations,
    dataMutations,
  ),
  actions: Object.assign({},
    uiActions,
    userActions,
    dataActions,
  ),
})
