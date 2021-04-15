import axios from 'axios'
import store from "@/store/index";
var base = ''

// const auth = store.state.token;
// const header = {'Authorization':auth}


/*
 对axios进行二次封装 请求拦截器增加token 响应拦截器处理大数据
*/


/*
自定义写法：const xxx = axios.create({}) 一个项目中可能有不同的服务器基础地址 就要用自定义写法设置不同的服务器基础地址
*/
// const instance = axios.create({baseURL: "http://127.0.0.1:8000"});
const instance = axios.create();
// 在instance(这是上面定义的自定义axios请求名称)上添加请求拦截器 补充请求头token信息
instance.interceptors.request.use(function (config) {
  const token = store.state.token;
  debugger
    if (token) {
        //将token放到请求头发送给服务器,将tokenkey放在请求头中
        config.headers.Authorization = token;
        // config.headers.WWW-Authenticate = token;
        //也可以这种写法
        // config.headers['accessToken'] = Token;
         return config;
    }
}, function (error) {
    // Do something with request error
    return Promise.reject(error);
})

export default instance


export const POST = (url, params) => {
  return instance.post(`${base}${url}`, params)

}

export const GET = (url, params) => {
  return instance.get(`${base}${url}`, { params: params })
}

export const PUT = (url, params) => {
  return instance.put(`${base}${url}`, params)
}

export const DELETE = (url, params) => {
  return instance.delete(`${base}${url}`, { data: params })
}