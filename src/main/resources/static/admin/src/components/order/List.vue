<!--suppress ALL -->
<template>
    <el-card class="box-card" shadow="never">
        <div slot="header" class="clearfix">
            <span>商品列表</span>
            <template class="noselect_btn" v-if="isSelectItem === 'false'">
                <el-button style="float: right; padding: 6px 0; margin: 0 10px;" type="text" @click="loadData"
                           icon="el-icon-refresh">刷新
                </el-button>
                <el-button style="float: right; padding: 6px 0" type="text" @click="jumpAdd" icon="el-icon-circle-plus">
                    添加
                </el-button>
            </template>
            <template class="select_btn" v-else>
                <el-button style="float: right; padding: 6px 0" type="text" @click="examine"
                           icon="el-icon-edit-outline">审核
                </el-button>
            </template>

            <el-form :inline="true" :model="param" class="demo-form-inline">
                <el-form-item label="商品标题">
                    <el-input size="mini" v-model="param.title" placeholder="可模糊关键字"></el-input>
                </el-form-item>
                <el-form-item>
                    <el-button size="mini" type="primary" plain icon="el-icon-search" @click="onSubmit">查询</el-button>
                </el-form-item>
            </el-form>
        </div>
        <el-table
                :data="tableData"
                v-loading="loading"
                border
                style="width: 100%;"
                stripe
                @select="tableItemSelect"
                @select-all="tableItemSelectAll"
                highlight-current-row>
            <el-table-column
                    fixed
                    prop="orderId"
                    label="订单id"
                    min-width="100">
            </el-table-column>
            <el-table-column
                    prop="orderMoney"
                    label="订单总价"
                    min-width="70">
            </el-table-column>
            <el-table-column
                    prop="orderAmount"
                    label="商品总价"
                    min-width="70">
            </el-table-column>
            <el-table-column
                    prop="despatchMoney"
                    label="总运费"
                    min-width="70">
            </el-table-column>
            <el-table-column
                    prop="offer"
                    label="优惠"
                    min-width="70">
            </el-table-column>
            <el-table-column
                    prop="username"
                    label="用户名"
                    min-width="70">
            </el-table-column>
            <el-table-column
                    prop="phone"
                    label="手机号"
                    min-width="70">
            </el-table-column>
            <el-table-column
                    prop="email"
                    label="邮箱"
                    min-width="120">
            </el-table-column>
            <el-table-column
                    prop="addr"
                    label="收货地址"
                    min-width="150">
            </el-table-column>
            <!--<el-table-column-->
            <!--prop="cover"-->
            <!--label="商品封面"-->
            <!--width="200">-->
            <!--</el-table-column>-->
            <el-table-column
                    prop="status"
                    label="状态"
                    min-width="70">
            </el-table-column>
            <el-table-column
                    prop="createTime"
                    label="创建时间"
                    min-width="100">
            </el-table-column>
            <el-table-column
                    fixed="right"
                    label="操作"
                    min-width="100">
                <template slot-scope="scope">
                    <el-button type="success" size="mini" plain @click="openDetails(scope.row)">详情</el-button>
                </template>
            </el-table-column>
        </el-table>
        <el-pagination
                @size-change="handleSizeChange"
                @current-change="handleCurrentChange"
                :current-page="currentPage"
                :page-sizes="[10, 20, 50, 100]"
                :page-size="param.pageSize"
                layout="total, sizes, prev, pager, next, jumper"
                :total="totalCount">
        </el-pagination>
        <el-dialog title="提示信息" :visible.sync="information">
            <span>请输入信息后再查询</span>
            <span slot="footer" class="dialog-footer">
            <el-button size="mini" type="primary" @click="information = false">确 定</el-button>
        </span>
        </el-dialog>

        <el-dialog
                title="订单详情"
                :visible.sync="orderInfoShow"
                width="30%">
            <div>
                <div>
                    <label>订单id</label>
                    <span>{{orderDetails.orderId}}</span>
                </div>
                <div>
                    <label>用户名称</label>
                    <span>{{orderDetails.username}}</span>
                </div>
                <div>
                    <label>用户手机号</label>
                    <span>{{orderDetails.phone}}</span>
                </div>
                <div>
                    <label>用户邮箱</label>
                    <span>{{orderDetails.email}}</span>
                </div>
                <el-card class="box-card" v-for="(orderInfoVO, index) in orderDetails.orderInfoVOS" :key="index">
                    <div slot="header" class="clearfix">
                        <span>{{orderInfoVO.goods.title}} <small style="color: #ff0000;">x{{orderInfoVO.number}}</small></span>
                        <!--<el-button style="float: right; padding: 3px 0" type="text">操作按钮</el-button>-->
                    </div>
                    <div>
                        商品原价：{{orderInfoVO.goods.originalPrice}}
                    </div>
                    <div>
                        促销价：{{orderInfoVO.goods.salePrice}}
                    </div>
                    <div>
                        促销状态：{{orderInfoVO.goods.saleStatus === 0 ? '未促销' : '促销'}}
                    </div>
                    <div>
                        库存：{{orderInfoVO.goods.stock}}
                    </div>
                    <div>
                        运费：{{orderInfoVO.goods.despatchMoney}}
                    </div>
                </el-card>
            </div>
        </el-dialog>
    </el-card>
</template>

<script>
    import httpUtil from '../../util/HttpUtil.js';

    export default {
        name: "OrderList",
        data() {
            return {
                information: false,
                isSelectItem: 'false',
                selectItem: [],
                error: {
                    msg: '暂无消息',
                    type: 'info',
                    show: 'true'
                },
                param: {
                    page: 1,
                    pageSize: 10,
                    title: '',
                },
                formInline: {
                    user: '',
                    region: ''
                },
                currentPage: 1, //当前页数
                currentNumber: '',
                pageSize: 10,
                totalCount: 0,
                totalPages: 0,

                loading: true,
                //totalElements: 0,
                tableData: [],
                enterpriseList: [], //企业列表
                orderInfoShow:false,
                orderDetails: {},
            }
        },
        methods: {

            formatterStatus(row) {
                return row.agStatus === 0 ? '启用' : '禁用';
            },
            //
            onSubmit() {
                let username = this.$data.param.username;
                let phoneNum = this.$data.param.phoneNum;
                let email = this.$data.param.email;
                let enterpriseId = this.$data.param.enterpriseId;
                if (username === '' & phoneNum === '' & email === '' & enterpriseId === '') {
                    this.information = true
                } else {
                    this.loadData();
                }

            },
            handleClick(row) {
                sessionStorage.setItem("userListUID", row.uid)
                this.$emit('eleven', '/user/info/');
                // console.log(row.uid)
            },
            handleSizeChange(val) {
                this.$set(this.$data.param, 'pageSize', val);
                this.$set(this.$data.param, 'page', 1);
                this.loadData();
                //console.log(`每页 ${val} 条`);
            },
            handleCurrentChange(val) {
                this.$set(this.$data.param, 'page', val);
                this.loadData();
                //console.log(`当前页: ${val}`);
            },
            alertClose(e) {
                //console.log(e);
            },

            loadData() {
                const that = this;
                this.$set(this.$data, 'loading', true);
                httpUtil.post(this, 'order', "list", {
                    'token': this.$store.state.user.token,
                    'page': this.$data.currentPage,
                    'pageSize': this.$data.pageSize
                }, function (resp) {

                    let data = JSON.parse(resp.data.data);
                    console.log(data)
                    // const data = JSON.parse(resp.body.data);
                    // console.log(data);
                    that.$set(that.$data, 'tableData', data.arr);
                    that.$set(that.$data, 'currentNumber', data.currentNumber);
                    that.$set(that.$data, 'currentPage', data.currentPage);
                    that.$set(that.$data, 'pageSize', data.pageSize);
                    that.$set(that.$data, 'totalCount', data.totalCount);
                    that.$set(that.$data, 'totalPages', data.totalPage);
                    //
                    that.$set(that.$data, 'totalElements', data.totalElements);
                    that.$set(that.$data, 'loading', false);
                })
            },
            openDetails(row) {
                console.log(row);
                this.$set(this.$data, 'orderDetails', row);
                this.$set(this.$data, 'orderInfoShow', true)
            },
            jumpAdd(row) {
                this.$emit('eleven', '/goods/edit/');
                // console.log(row.uid)

            },
            tableItemSelect(selection, row) {
                if (selection.length > 0) {
                    this.$set(this.$data, 'isSelectItem', 'true')
                } else {
                    this.$set(this.$data, 'isSelectItem', 'false')
                }
                this.$set(this.$data, 'selectItem', selection)
            },
            tableItemSelectAll(selection) {
                if (selection.length > 0) {
                    this.$set(this.$data, 'isSelectItem', 'true')
                } else {
                    this.$set(this.$data, 'isSelectItem', 'false')
                }
                this.$set(this.$data, 'selectItem', selection)
            },
            examine() {
                this.$alert(this.$data.selectItem, '审核内容', {
                    confirmButtonText: '确定',
                    callback: action => {
                        this.$message({
                            type: 'info',
                            message: `action: ${ action }`
                        });
                    }
                });
                //console.log('++++++++++++++++++')
                // console.log('审核内容')
                //console.log(this.$data.selectItem)
                //console.log('++++++++++++++++++')

            },
            querySearchAsync(query) {
                if (query !== "") {
                    const that = this;
                    httpUtil.get(this, 'enterprise', "getEnterpriseDropDown?keyword=" + query, (resp) => {
                        const data = JSON.parse(resp.body.data);
                        let list = [];
                        for (let i = 0; i < data.length; i++) {
                            list.push({
                                label: data[i].epShortName,
                                value: data[i].eid
                            });
                        }
                        that.$set(that.$data, 'enterpriseList', list);
                    });
                }
            },
            handleSelect(item) {
                console.log("选中项的值为", item);
            }

        },
        mounted() {
            console.log(this.$data.param.username)

            // load data
            this.loadData();
            this.$set(this.$data, 'totalPages', 1)
        }
    }
</script>

<style>
    .el-pagination {
        margin-top: 1rem;
    }

    .clearfix > span {
        text-align: left !important;
    }

    .el-form-item {
        margin-bottom: 0;
        margin-top: 1rem;
    }

    .box-card {
        height: 100%;
    }

    .el-card__header, .el-card__body {
        padding: 0.5rem;
    }
</style>
