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
			// email: payload[0],
			// password: payload[1],
			email: 'taufiqelrahman@taufiq.com',
			password: 'elrahman',
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
