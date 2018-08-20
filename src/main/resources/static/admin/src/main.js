import Vue from 'vue'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import App from './App.vue'  
import VueResource from "vue-resource"
import routes from './router/router'
import VueRouter from "vue-router";
import menu from './config/menu.js'
import Vuex from 'vuex'
import UserList from './components/user/List'
import UserInfo from './components/user/info'
import EnterpriseList from './components/enterprise/List'
import Home from './components/Home'
import AuthGroupEdit from './components/auth/AuthGroupEdit'
import EditAuthValue from './components/auth/EditAuthValue'
import Validate from './util/Validate'
//引入字体图标库
import "./assets/icomoon/style.css";
import  VueQuillEditor from 'vue-quill-editor'
import 'quill/dist/quill.core.css'
import 'quill/dist/quill.snow.css'
import 'quill/dist/quill.bubble.css'

Vue.use(ElementUI)
const VueCookie = require('vue-cookie');
Vue.use(VueCookie);
Vue.use(VueResource);
Vue.use(Vuex);

Vue.use(VueQuillEditor)

Vue.prototype.$menu = menu;

const router = new VueRouter({routes});
const store = new Vuex.Store({
    state: {
        login: 0,
        user: {}
    },
    mutations: {
        loginSuccess(state, user) {
            state.login = 1;
            state.user = user;
        },
    },
    getters:{
        login(state){
            return state.login;
        },
        user(state){
            return state.user;
        }
    },

});
const vum = new Vue({
    el: '#app',
    router,
    store,
    components:{
        'UserList': UserList,
        'UserInfo': UserInfo,
        'EnterpriseList': EnterpriseList,
        'Home': Home,
        'AuthGroupEdit':AuthGroupEdit,
        'EeditAuthValue': EditAuthValue,
    },
    render: h => h(App)
});


Vue.prototype.Validate = Validate;



export default {router}
