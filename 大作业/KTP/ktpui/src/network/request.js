import axios from 'axios'
import store from '../store'
import router from '../router'

export function request(config) {
  const request = axios.create()

  config.headers = {
    'token': store.state.token
  }

  request.interceptors.response.use(function (response) {
    console.log(response);
    if (response.data.state == false) {
      router.replace('/')
    }

    return response
  })
  return request(config)
}
