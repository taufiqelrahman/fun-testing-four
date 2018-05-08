import Moment from 'moment'
import { getFromStorageArr, getFromStorageObj, getFromStorage } from 'utils.js'

export const ui = {
  showLoader: false,
  isLoggedIn: getFromStorage('access_token') ? true : false,
  showAlert: false,
  alertMessage: '',
  showSpinner: false,
  showToast: false,
  toastMessage: '',
}

export const user = {
  info: {},
  access_token: getFromStorage('access_token'),
}

export const data = {
  squads: null,
  features: [],
  scenarios: null,
  scenarioReport: [],
  steps: [],
  summaries: null,
}
