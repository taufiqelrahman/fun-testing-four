import Vue from 'vue'
import axios from 'axios'
import router from 'router'
import { setToStorage, setToStorageJSON, getFromStorageObj, axiosConfig, axiosConfigAuth, URL } from 'utils';

import {
	TOGGLE_ALERT,
	TOGGLE_SPINNER,
	TOGGLE_TOAST,
	LOG_OUT,
	LOG_IN,
	SET_TOKEN,
	SET_USER,
	SET_DATA,
} from './mutation-types.js'

export const uiActions = {
	logOut({ commit }) {
		localStorage.removeItem('access_token')
		commit(LOG_OUT)
		// router.push('/')
		location.reload()
	},
	logIn({ commit }, payload) {
		const bodyData = {
			email: payload.email,
			password: payload.password,
			// email: 'taufiqelrahman@taufiq.com',
			// password: 'elrahman',
		}
		axios.post(URL.login, bodyData, axiosConfig())
			.then(res => {
				const user = res.data.user
				const token = res.data.authentication_token
				setToStorage('access_token', token)
				commit(SET_TOKEN, token)
				commit(LOG_IN)
				router.push('/')
		 		// commit(TOGGLE_SPINNER, false)
			})
			.catch(err => {
				commit(TOGGLE_SPINNER, false)
				commit(TOGGLE_ALERT, { show: true, message: err.response.data.message })
			})
	},
}

export const userActions = {
	getUser({ commit }) {
		axios.get(URL.user, axiosConfigAuth())
			.then(res => {
				const user = res.data.data
				commit(SET_USER, user)
				// 	commit(TOGGLE_SPINNER, false)
			})
			.catch(err => {
				commit(TOGGLE_SPINNER, false)
				commit(TOGGLE_ALERT, { show: true, message: err.response.data.message })
			})
	},
}

export const dataActions = {
	getSquads({ commit }) {
		axios.get(URL.squads, axiosConfigAuth())
			.then(res => {
				commit(SET_DATA, { type: 'squads', data: res.data.data })
				// 	commit(TOGGLE_SPINNER, false)
			})
			.catch(err => {
				commit(TOGGLE_SPINNER, false)
				commit(TOGGLE_ALERT, { show: true, message: err.response.data.message })
			})
	},
	getFeatures({ commit }, payload) {
		const endpoint = URL.features.replace('[ID]', payload)
		axios.get(endpoint, axiosConfigAuth())
			.then(res => {
				commit(SET_DATA, { type: 'features', data: res.data.data })
				// 	commit(TOGGLE_SPINNER, false)
			})
			.catch(err => {
				commit(TOGGLE_SPINNER, false)
				commit(TOGGLE_ALERT, { show: true, message: err.response.data.message })
			})
	},
	createFeature({ commit }, payload) {
		const bodyData = {
			title: payload.title,
		}
		const endpoint = URL.features.replace('[ID]', payload.id)
		return new Promise((resolve, reject) => {
			axios.post(endpoint, bodyData, axiosConfigAuth())
				.then(res => {
					// commit(TOGGLE_SPINNER, false)
					resolve(true)
				})
				.catch(err => {
					commit(TOGGLE_SPINNER, false)
					commit(TOGGLE_ALERT, { show: true, message: err.response.data.message })
				})
		})
	},
	editFeature({ commit }, payload) {
		const bodyData = {
			title: payload.title,
		}
		const endpoint = URL.feature.replace('[ID]', payload.id)
		return new Promise((resolve, reject) => {
			axios.put(endpoint, bodyData, axiosConfigAuth())
				.then(res => {
					// commit(TOGGLE_SPINNER, false)
					resolve(true)
				})
				.catch(err => {
					commit(TOGGLE_SPINNER, false)
					commit(TOGGLE_ALERT, { show: true, message: err.response.data.message })
				})
		})
	},
	deleteFeature({ commit }, payload) {
		const endpoint = URL.feature.replace('[ID]', payload)
		return new Promise((resolve, reject) => {
			axios.delete(endpoint, axiosConfigAuth())
				.then(res => {
					// commit(TOGGLE_SPINNER, false)
					// alert('delete success')
					resolve(true)
				})
				.catch(err => {
					commit(TOGGLE_SPINNER, false)
					commit(TOGGLE_ALERT, { show: true, message: err.response.data.message })
				})
		}) 
	},
	getScenarios({ commit }, payload) {
		const endpoint = URL.scenarios.replace('[ID]', payload)
		axios.get(endpoint, axiosConfigAuth())
			.then(res => {
				commit(SET_DATA, { type: 'scenarios', data: res.data.data })
				// 	commit(TOGGLE_SPINNER, false)
			})
			.catch(err => {
				commit(TOGGLE_SPINNER, false)
				commit(TOGGLE_ALERT, { show: true, message: err.response.data.message })
			})
	},
	createScenario({ commit }, payload) {
		const bodyData = {
			title: payload.title,
			steps: payload.steps,
			feature_id: payload.id,
		}
		const endpoint = URL.scenario.replace('[ID]', '')
		return new Promise((resolve, reject) => {
			axios.post(endpoint, bodyData, axiosConfigAuth())
				.then(res => {
					// commit(TOGGLE_SPINNER, false)
					resolve(true)
				})
				.catch(err => {
					commit(TOGGLE_SPINNER, false)
					commit(TOGGLE_ALERT, { show: true, message: err.response.data.message })
				})
		})
	},
	editScenario({ commit }, payload) {
		const bodyData = {
			title: payload.title,
			steps: payload.steps,
		}
		const endpoint = URL.scenario.replace('[ID]', payload.id)
		return new Promise((resolve, reject) => {
			axios.put(endpoint, bodyData, axiosConfigAuth())
				.then(res => {
					// commit(TOGGLE_SPINNER, false)
					resolve(true)
				})
				.catch(err => {
					commit(TOGGLE_SPINNER, false)
					commit(TOGGLE_ALERT, { show: true, message: err.response.data.message })
				})
		})
	},
	deleteScenario({ commit }, payload) {
		const endpoint = URL.scenario.replace('[ID]', payload)
		return new Promise((resolve, reject) => {
			axios.delete(endpoint, axiosConfigAuth())
				.then(res => {
					// commit(TOGGLE_SPINNER, false)
					resolve(true)
				})
				.catch(err => {
					commit(TOGGLE_SPINNER, false)
					commit(TOGGLE_ALERT, { show: true, message: err.response.data.message })
				})
		})
	},
	generateFeatureReport({ dispatch, commit }, payload) {
		const endpoint = URL.featureReport.replace('[ID]', payload)
		return new Promise((resolve, reject) => {
			axios.post(endpoint, {}, axiosConfigAuth())
				.then(res => {
					const id = res.data.data.id
					dispatch('getFeatureReport', res.data.data.id)
						.then(res => {
							if (res) resolve(id)
						})
					// commit(TOGGLE_SPINNER, false)
				})
				.catch(err => {
					commit(TOGGLE_SPINNER, false)
					commit(TOGGLE_ALERT, { show: true, message: err.response.data.message })
				})
		})
	},
	getFeatureReport({ commit }, payload) {
		const endpoint = URL.featureReportDetail.replace('[ID]', payload)
		return new Promise((resolve, reject) => {
			axios.get(endpoint, axiosConfigAuth())
				.then(res => {
					commit(SET_DATA, { type: 'scenarioReport', data: res.data.data })
					// commit(TOGGLE_SPINNER, false)
					resolve(true)
				})
				.catch(err => {
					commit(TOGGLE_SPINNER, false)
					commit(TOGGLE_ALERT, { show: true, message: err.response.data.message })
				})
		})
	},
	updateReportScenario({ dispatch, commit }, payload) {
		const bodyData = {
			state: payload.state,
			description: payload.description,
		}
		const endpoint = URL.updateReportScenario.replace('[ID]', payload.id)
		return new Promise((resolve, reject) => {
			axios.put(endpoint, bodyData, axiosConfigAuth())
				.then(res => {
					resolve(true)
					// commit(TOGGLE_SPINNER, false)
				})
				.catch(err => {
					commit(TOGGLE_SPINNER, false)
					commit(TOGGLE_ALERT, { show: true, message: err.response.data.message })
				})
		})
	},
	getSteps({ commit }, payload) {
		const endpoint = URL.steps.replace('[ID]', payload)
		return new Promise((resolve, reject) => {
			axios.get(endpoint, axiosConfigAuth())
				.then(res => {
					commit(SET_DATA, { type: 'steps', data: res.data.data })
					// commit(TOGGLE_SPINNER, false)
					resolve(true)
				})
				.catch(err => {
					commit(TOGGLE_SPINNER, false)
					commit(TOGGLE_ALERT, { show: true, message: err.response.data.message })
				})
		})
	},
	getSummaries({ commit }, payload) {
		const endpoint = URL.summaries.replace('[ID]', payload)
		return new Promise((resolve, reject) => {
			axios.get(endpoint, axiosConfigAuth())
				.then(res => {
					commit(SET_DATA, { type: 'summaries', data: res.data.data })
					// commit(TOGGLE_SPINNER, false)
					resolve(true)
				})
				.catch(err => {
					commit(TOGGLE_SPINNER, false)
					commit(TOGGLE_ALERT, { show: true, message: err.response.data.message })
				})
		})
	},
	getFeatureFromReport({ commit }, payload) {
		const endpoint = URL.featureFromReport.replace('[ID]', payload)
		return new Promise((resolve, reject) => {
			axios.get(endpoint, axiosConfigAuth())
				.then(res => {
					commit(SET_DATA, { type: 'feature', data: res.data.data })
					// commit(TOGGLE_SPINNER, false)
					resolve(true)
				})
				.catch(err => {
					commit(TOGGLE_SPINNER, false)
					commit(TOGGLE_ALERT, { show: true, message: err.response.data.message })
				})
		})
	},
}
