import {createRouter, createWebHistory} from 'vue-router'
import resource_management from "../components/resource_management/resource_management";
import soft_deploy from "../components/soft_deploy/soft_deploy";
import app_deploy from "../components/app_deploy/app_deploy";
import login from "../components/login/login";
import home from "../home/home";
import app_conf from "../components/app_conf/app_conf";
import setting from "../components/setting";
import Layout from "../layout/index";


const routes = [
    {
        path: '/login',
        name: 'login',
        component: login
    },
    {
        path: '/',
        name: 'layout',
        component: Layout,
        meta: {
            requireAuth: true  // 配置此条，进入页面前判断是否需要登陆
        },
        children: [
            {
                path: "/home",
                component: home,
                name: "home"
            },
            {
                path: '/resource_management',
                name: 'resource_management',
                component: resource_management
            },
            {
                path: '/soft_deploy',
                name: 'soft_deploy',
                component: soft_deploy
            },
            {
                path: '/app_deploy',
                name: 'app_deploy',
                component: app_deploy
            },
            {
                path: '/app_conf',
                name: 'app_conf',
                component: app_conf
            },
            {
                path: '/setting',
                name: 'setting',
                component: setting
            }
        ]
    },
    {
        path: '/about',
        name: 'About',
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
    }
]

const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes
})

router.beforeEach((to, from, next) => {
    if (to.matched.some(res => res.meta.requireAuth)) { // 验证是否需要登陆
        //debugger
        if (localStorage.getItem('token')) { // 查询本地存储信息是否已经登陆
            next();
        } else {
            next({
                path: '/login', // 未登录则跳转至login页面
                query: {redirect: to.fullPath} // 登陆成功后回到当前页面，这里传值给login页面，to.fullPath为当前点击的页面
            });
        }
    } else {
        next();
    }
})

export default router
