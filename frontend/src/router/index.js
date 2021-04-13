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

export default router
