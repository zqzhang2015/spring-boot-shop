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
import GoodsList from '../components/goods/List'
import GoodsEdit from '../components/goods/Edit'
import OrderList from '../components/order/List'

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
    },
    {
        path: '/goods',
        component: GoodsList,
        children: [
            {
                path : 'list',
                component: GoodsList
            },
            {
                path : 'add',
                component: GoodsEdit
            },
            {
                path : 'edit',
                component: GoodsEdit
            }
        ]
    },{
        path: '/order',
        component: OrderList,
        children: [
            {
                path : 'list',
                component: OrderList
            }
        ]
    }
];

export  default  routes

