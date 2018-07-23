/**
 *  加载模块
 */


import UserList from '../components/user/List'
import UserInfo from '../components/user/Info'
import EnterpriseList from '../components/enterprise/List'
import EnterpriseEdit from '../components/enterprise/Edit'
import UserEdit from '../components/user/Edit'
import MenuList from '../components/auth/MenuList'
import AuthGroup from '../components/auth/AuthGroup'
import EditAuthValue from '../components/auth/EditAuthValue'
const routes = [
    {
        path: '/user',
        component: UserList,
        children: [
            {
                path : 'list',
                component: UserList
            },
            {
                path: 'getUser/:uid',
                component: UserInfo
            },{
                path: 'addUser',
                component: UserEdit
            }
        ]
    },
    {
        path: '/enterprise',
        component: EnterpriseList,
        children: [
            {
                path : 'list',
                component: EnterpriseList
            },
            {
                path : 'edit',
                component: EnterpriseEdit
            },
        ]
    },
    {
        path: '/auth',
        component: MenuList,
        children: [
            {
                path : 'menulist',
                component: MenuList
            },{
                path : 'authgroup',
                component: AuthGroup
            },{
                path: 'editAuthValue',
                component:  EditAuthValue
            }
        ]
    }
];

export  default  routes

