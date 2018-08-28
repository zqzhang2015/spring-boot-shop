<template>
    <div id="app">
        <el-container>
            <el-header>
                <el-menu
                        default-active="spterp"
                        class="el-menu-header"
                        mode="horizontal"
                        @select="handleSelect"
                        :background-color="backgroundColor"
                        text-color="#fff"
                        active-text-color="#99CCFF">
                    <el-menu-item index="spterp">选货邦后台管理系统</el-menu-item>
                    <el-menu-item class="right-menu-item" v-if="store.login === 0" index="#" @click="loginWindow=true">
                        登录
                    </el-menu-item>
                    <el-menu-item class="right-menu-item" v-if="store.login === 1" index="3">
                        <el-dropdown style="color: #fff; margin-top: -2px;">
                            <span class="el-dropdown-link">{{user.username}}<i class="el-icon-arrow-down el-icon--right" style="color:#fff;"></i>
                            </span>
                            <el-dropdown-menu slot="dropdown">
                                <el-dropdown-item>我的信息</el-dropdown-item>
                                <el-dropdown-item>修改密码</el-dropdown-item>
                                <el-dropdown-item divided>退出</el-dropdown-item>
                            </el-dropdown-menu>
                        </el-dropdown>
                    </el-menu-item>
                    <el-menu-item class="right-menu-item" v-if="store.login === 1" index="4">消息</el-menu-item>
                    <!--<el-menu-item class="right-menu-item"  index="1.html">dddd</el-menu-item>-->
                </el-menu>
            </el-header>
            <el-container>
                <el-aside width="200px">
                    <el-menu
                            @select="selectItem"
                            @open="handleOpen"
                            @close="handleClose"
                            :background-color="backgroundColor"
                            text-color="#fff"
                            active-text-color="#99CCFF">

                         <el-submenu v-for="(menuItem, index) in leftMenu" :disabled="store.login === 0" :index="menuItem.menuIndex" :key="index">
                            <template slot="title" :tabindex="menuItem.menuIndex">
                                <i class="el-icon-menu"></i>
                                <span slot="title">{{ menuItem.menuName }}</span>
                            </template>
                            <el-menu-item v-for="(item, i) in menuItem.menuItems"
                                          :data-key="item.itemName"
                                          :index="item.itemIndex">
                                {{ item.itemName }}
                            </el-menu-item>
                        </el-submenu>
                    </el-menu>
                </el-aside>
                <el-container>
                    <el-main >
                        <el-tabs v-model="editableTabsValue2" type="card" closable @tab-remove="removeTab"
                                 @tab-click="tabClick">
                            <el-tab-pane
                                    v-for="item in editableTabs2"
                                    :key="item.name"
                                    :label="item.title"
                                    :name="item.name">
                                <keep-alive>
                                    <div class="tab-content" :is="item.name" @eleven="eleven"></div>
                                </keep-alive>
                            </el-tab-pane>
                        </el-tabs>
                    </el-main>
                    <el-footer>Copyright © 2018, Content By lhr 保留所有权利.</el-footer>
                </el-container>
            </el-container>
        </el-container>

        <!-- 登录窗口 -->
        <el-dialog
                title="登 录"
                :visible.sync="loginWindow"
                width="30%">
            <div>
                <el-form ref="loginForm" :rules="rules" :model="loginForm" label-width="80px">
                    <el-form-item label="手机号" prop="phone">
                        <el-input v-model="loginForm.phone"></el-input>
                    </el-form-item>
                    <el-form-item label="密码" prop="password">
                        <el-input type="password" v-model="loginForm.password"></el-input>
                    </el-form-item>
                </el-form>
            </div>
            <span slot="footer" class="dialog-footer">
                <el-button @click="loginWindow = false">取 消</el-button>
                <el-button type="primary" @click="loginDo('loginForm')">登 录</el-button>
            </span>
        </el-dialog>


    </div>
</template>

<script>
    import httpUtil from './util/HttpUtil.js';

    import Home from "./components/Home";
    import UserList from './components/user/List'
    import UserInfo from './components/user/Info'
    import UserEdit from './components/user/Edit'
    import EnterpriseList from './components/enterprise/List'
    import EnterpriseEdit from './components/enterprise/Edit'
    import MenuList from './components/auth/MenuList'
    import AuthGroup from './components/auth/AuthGroup'
    import AuthGroupEdit from './components/auth/AuthGroupEdit'
    import EditAuthValue from './components/auth/EditAuthValue'

    import GoodsList from './components/goods/List'
    import GoodsEdit from './components/goods/Edit'
    import GoodsAdd from './components/goods/Edit'
    import OrderList from './components/order/list'
    import SystemIndex from './components/system/Index'


    export default {
        components: {
            Home,
            UserList,
            EnterpriseList,
            EnterpriseEdit,
            UserInfo,
            UserEdit,
            MenuList,
            AuthGroup,
            AuthGroupEdit,
            EditAuthValue,
            GoodsList,
            GoodsAdd,
            GoodsEdit,
            OrderList,
            SystemIndex
        },
        data() {
            return {
                loginWindow: false, // false不显示登录窗口，true显示
                store: this.$store.state,
                backgroundColor: '#567390',
                loginForm:{
                    // 登录表单
                    username:'',
                    password:'',
                },
                user:{

                },
                leftMenu: [
                    {
                        menuIndex: 'enterprise',
                        menuName: '企业管理',
                        menuItems: [
                            {
                                itemIndex: '/enterprise/list',
                                itemName: '企业列表'
                            }
                        ]
                    },
                    {
                        menuIndex: 'user',
                        menuName: '用户管理',
                        menuItems: [
                            {
                                itemIndex: '/user/list',
                                itemName: '用户列表'
                            }
                        ]
                    },
                    {
                        menuIndex: 'auth',
                        menuName: '权限管理',
                        menuItems: [
                            {
                                itemIndex: '/auth/menulist',
                                itemName: '菜单列表'
                            },
                            {
                                itemIndex: '/auth/authgroup',
                                itemName: '权限组管理'
                            }
                        ]
                    },
                    {
                        menuIndex: 'goods',
                        menuName: '商品管理',
                        menuItems: [
                            {
                                itemIndex: '/goods/list',
                                itemName: '商品列表'
                            },
                        ]
                    },
                    {
                        menuIndex: 'order',
                        menuName: '订单管理',
                        menuItems: [
                            {
                                itemIndex: '/order/list',
                                itemName: '订单列表'
                            },
                        ]
                    },{
                        menuIndex: 'system',
                        menuName: '系统管理',
                        menuItems: [
                            {
                                itemIndex: '/system/index',
                                itemName: '系统管理'
                            },
                        ]
                    }
                ],
                activeIndex: 'Home',
                activeIndex2: 'Home',
                editableTabsValue2: 'Home',
                editableTabs2: [
                    {
                        title: '首页',
                        name: 'Home',
                    },
                    // {
                    //   title: 'Tab 2',
                    //   name: '2',
                    // }
                ],
                tabIndex: 2,
                //表单验证
                rules:{
                    phone: [
                        { required: true, message: '账号不能为空', trigger: 'change' },
                        { min: 2, max: 20, message: '长度在 2 到 20 个字符', trigger: 'blur' }
                    ],
                    password: [
                        { required: true, message: '密码不能为空', trigger: 'blur' },
                        { min: 2, max: 20, message: '长度在 2 到 20 个字符', trigger: 'blur' }
                    ]
                }
            };
        },
        mounted() {
            const token = this.$cookie.get('token');

            if(token.length > 10){
                const that = this;
                const sendData = {
                    'token': token
                }
                httpUtil.post(this, 'user', 'tokenUse', sendData, function(data){
                    const dt = data.body;
                    if(dt.code !== 0){
                        return;
                    }
                    const user = JSON.parse(dt.data);
                    that.$set(that.$data, 'user', user);
                    //console.log(user)
                    that.$cookie.set('token', user.token);
                    that.$set(that.$data, 'user', user);
                    that.$store.commit('loginSuccess', user);
                    // console.log()
                    that.$set(that.$data,'loginWindow', false);
                    that.$set(that.$data.store, 'login', 1);
                })

            }
        },
        methods: {
            //登录方法
            loginDo(formName){
                const that = this;
                that.$refs[formName].validate((valid) => {
                    if (valid) {
                        httpUtil.post(that, 'user', 'loginAdmin', that.loginForm,function(data){
                            const dt = data.body;
                            //console.log(dt)
                            //console.log(dt.code)
                            if(dt.code !== 0){
                                return;
                            }
                            that.$message({
                                message: '登录成功',
                                type: 'success'
                            });
                            const user = JSON.parse(dt.data);
                            that.$set(that.$data, 'user', user);
                            that.$store.commit('loginSuccess', user);
                            that.$cookie.set('token', user.token);
                            // console.log()
                            that.$set(that.$data,'loginWindow', false);
                            that.$set(that.$data.store, 'login', 1);
                        });
                    } else {
                        return false;
                    }
                });
            },
            tabClick(e) {
                //console.log(e)
            },
            addTab(targetName) {
               // console.log('add')

                let newTabName = ++this.$data.tabIndex + '';
                const tabs = this.$data.editableTabs2;
                // 判断是否存在

                for (let i = 0; i < tabs.length; i++) {
                    //console.log(tabs[i])
                    //console.log(this.$menu)
                    if (tabs[i]['title'] === targetName) {
                        this.$set(this.$data, 'editableTabsValue2', this.$menu[targetName].componentName);
                        this.$router.push(this.$menu[targetName].path);
                        return;
                    }
                }
                tabs.push({
                    title: targetName,
                    name: this.$menu[targetName].componentName
                });
                this.$set(this.$data, 'editableTabs2', tabs);
                this.$set(this.$data, 'editableTabsValue2', this.$menu[targetName].componentName);
            },
            removeTab(targetName) {
                let tabs = this.$data.editableTabs2;
                let activeName = this.$data.editableTabsValue2;
                if (activeName === targetName) {
                    tabs.forEach((tab, index) => {
                        if (tab.name === targetName) {
                            let nextTab = tabs[index + 1] || tabs[index - 1];
                            if (nextTab) {
                                activeName = nextTab.name;
                            }
                        }
                    });
                }
                this.$set(this.$data, 'editableTabsValue2', activeName);
                this.$set(this.$data, 'editableTabs2', tabs.filter(tab => tab.name !== targetName));
            },
            eleven(key) {
                //console.log(key)
                this.selectItem(key, '')
            },
            handleOpen(key, keyPath) {
                // this.addTab(key)
                //console.log(key, keyPath);
            },
            handleClose(key, keyPath) {
               // console.log(key, keyPath);
            },
            handleSelect(key, keyPath) {
                //console.log(key, keyPath);
            },
            selectItem(key, keyPath) {
                // Vue.router.push({path: key})
                //console.log('APP ==> selectItem ==> key={' + key + '}')
                //判断是否存在
                if (key === '/user/list') {
                    this.addTab('用户列表');
                    // router.push('/user/list')
                }
                else if (key.length >= '/enterprise/list'.length &&
                    key === '/enterprise/list') {
                    this.addTab('企业列表');
                } else if (key.length >= '/user/info'.length &&
                    key.substring(0, '/user/info'.length) === '/user/info') {
                    this.addTab('用户详情');
                } else if (key.length >= '/user/edit'.length &&
                    key.substring(0, '/user/edit'.length) === '/user/edit') {
                    this.addTab('编辑用户');
                }else if (key.length >= '/auth/menulist'.length &&
                    key.substring(0, '/auth/menulist'.length) === '/auth/menulist') {
                    this.addTab('菜单列表');
                }else if (key.length >= '/auth/authgroup'.length &&
                    key.substring(0, '/auth/authgroup'.length) === '/auth/authgroup') {
                    this.addTab('权限组管理');
                }else if (key.length >= '/auth/editAuthValue'.length &&
                    key.substring(0, '/auth/editAuthValue'.length) === '/auth/editAuthValue') {
                    this.addTab('编辑权限');
                }else if (key.length >= '/goods/list'.length &&
                    key.substring(0, '/goods/list'.length) === '/goods/list') {
                    this.addTab('商品列表');
                }
                else if (key.length >= '/goods/add'.length &&
                    key.substring(0, '/goods/add'.length) === '/goods/add') {
                    this.addTab('添加商品');
                }
                else if (key.length >= '/goods/edit'.length &&
                    key.substring(0, '/goods/edit'.length) === '/goods/edit') {
                    this.addTab('编辑商品');
                }
                else if (key.length >= '/order/list'.length &&
                    key.substring(0, '/order/list'.length) === '/order/list') {
                    this.addTab('订单列表');
                }else if (key.length >= '/system/index'.length &&
                    key.substring(0, '/system/index'.length) === '/system/index') {
                    this.addTab('系统管理');
                }
                console.log("路由跳转："+key)

            }
        }
    }
</script>

<style>
    #app {
        font-family: Helvetica, sans-serif;
        height: 100%;
    }

    .el-header, .el-aside {
        background-color: #567390;
    }

    /*, .el-aside*/
    .el-container {
        height: 100%;
    }

    .el-menu {
        border-right: solid 0;
    }

    thead > tr > th {
        background-color: #dbe5ec !important;
        color: #666;
    }

    html, body {
        width: 100%;
        height: 100%;
        margin: 0;
        padding: 0;
    }

    /* .el-header {
        margin: 0; */
        /* padding: 0;
    } */

    .el-pagination, .el-footer {
        text-align: center;
    }

    .el-footer {
        /*padding-top: 1rem;*/
        height: 1rem;
        padding-top: 1rem;
    }

    .right-menu-item {
        float: right !important;
    }

    .el-table td, .el-table th {
        padding: 5px 0;
    }
</style>
