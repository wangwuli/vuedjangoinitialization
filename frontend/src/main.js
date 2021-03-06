import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import ElementPlus from 'element-plus';
import 'element-plus/lib/theme-chalk/index.css';
import Vuex from 'vuex'

const app = createApp(App)
app.use(ElementPlus)
app.use(store)
app.use(router)
app.use(Vuex)
app.mount('#app')


// const app = createApp({
//   ...App
// })
// app.use(router)
// app.use(store)
// app.use(ElementPlus)
// app.use(Vuex)
// app.mount('#app')