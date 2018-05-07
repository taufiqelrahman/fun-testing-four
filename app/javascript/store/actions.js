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
} from './mutation-types.js'

export const uiActions = {
	logOut({ commit }) {
		localStorage.removeItem('access_token')
		commit(LOG_OUT)
		// router.push('/')
		location.reload()
	},
	logIn({ commit }, payload) {
		// const bodyData = {
		// 	email: payload[0],
		// 	password: payload[1],
		// }
		// axios.post(URL.loginURL, bodyData, axiosConfig())
		// 	.then(res => {
		// 		const user = res.data.data.user
		// 		setToStorage('access_token', user.access_token)
		setToStorage('access_token', 'token')
		// 		commit(SET_USER, user.access_token)
		commit(LOG_IN)
		// 		commit(SET_USER_INFO, user)
		router.push('/')
		// 		commit(TOGGLE_SPINNER, false)
		// 	})
		// 	.catch(err => {
		// 		commit(TOGGLE_SPINNER, false)
		// 		commit(TOGGLE_ALERT, { show: true, message: err.response.data.message })
		// 	})
	},
}

export const userActions = {
}
