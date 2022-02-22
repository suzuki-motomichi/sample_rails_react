import axios from 'axios';
import { restaurantsIndex } from '../urls/index'

export const fetchRestaurants = () => {
  // axiosのGETリクエストで非同期処理
  return axios.get(restaurantsIndex) // importした文字列に対してaxios.getでHTTPリクエストを投げている
  // 成功した場合はthen(...)
  .then(res => {
    return res.data
  })
  // 失敗・例外が帰ってきた場合はcatch(...)へ
  .catch((e) => console.error(e))
  // axios.get(文字列).then().catch()の形で非同期処理が出来る
}
