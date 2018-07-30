<template>
    <el-card class="box-card">
        <div slot="header" class="clearfix">
            <span>{{title}}</span>
            <!--<el-button style="float: right; padding: 3px 0" type="text">编辑</el-button>-->
        </div>

        <el-form ref="goods" :model="goods" label-width="80px" >
            <el-form-item label="商品标题" prop="username">
                <el-input size="mini" v-model="goods.title" placeholder="请输入商品标题"></el-input>
            </el-form-item>
            <el-form-item label="商品描述" prop="describe">
                <el-input size="mini" v-model="goods.describe" style="width: 200px" type="textarea" placeholder="请输入商品描述"></el-input>
            </el-form-item>
            <el-form-item label="原价" prop="originalPrice">
                <el-input size="mini" v-model="goods.originalPrice" type="text" placeholder="请输入原价"></el-input>
            </el-form-item>
            <el-form-item label="活动价" prop="salePrice">
                <el-input size="mini" v-model="goods.salePrice" placeholder="请输入活动价"></el-input>
            </el-form-item>
            <el-form-item label="开启活动" prop="saleStatus">
                <el-switch size="mini" v-model="goods.saleStatus"></el-switch>
            </el-form-item>
            <el-form-item label="商品封面" prop="cover">
                <el-upload
                        class="upload-demo"
                        :action="coverUploadUrl"
                        :on-preview="handlePreview"
                        :on-remove="handleRemove"
                        :on-success="coverSuccess"
                        :file-list="coverImages"
                        :multiple="false"
                        list-type="picture">
                    <el-button size="small" type="primary">点击上传</el-button>
                    <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>
                </el-upload>
            </el-form-item>
            <el-form-item label="上架" prop="status">
                <el-switch size="mini" v-model="goods.status"></el-switch>
            </el-form-item>
            <!--<el-form-item label="启用状态" prop="status">-->
                <!--<el-select size="mini" v-model="user.status" placeholder="请选择状态">-->
                    <!--<el-option label="启用" :value="0"></el-option>-->
                    <!--<el-option label="禁用" :value="1"></el-option>-->
                <!--</el-select>-->
            <!--</el-form-item>-->
            <el-form-item label="库存" prop="stock">
                <el-input size="mini" v-model="goods.stock" placeholder="库存"></el-input>
            </el-form-item>
            <el-form-item label="发货地" prop="deliveryPlace">
                <el-input size="mini" v-model="goods.deliveryPlace" placeholder="发货地"></el-input>
            </el-form-item>
            <el-form-item label="快递费" prop="despatchMoney">
                <el-input size="mini" v-model="goods.despatchMoney" placeholder="快递费"></el-input>
            </el-form-item>
            <el-form-item label="轮播图" prop="pictures">
                <el-upload
                        class="upload-demo"
                        :action="picturesUploadUrl"
                        :on-preview="handlePreview"
                        :on-remove="handleRemove"
                        :on-success="picturesSuccess"
                        :file-list="picturesImages"
                        :multiple="true"
                        list-type="picture">
                    <el-button size="small" type="primary">点击上传</el-button>
                    <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>
                </el-upload>
            </el-form-item>
            <el-form-item size="small">
                <el-button type="primary" size="mini" @click="onSubmit('goods')">提交</el-button>
            </el-form-item>
            <el-form-item label="快递费" prop="despatchMoney">
                <div class="edit_container">
                    <quill-editor
                            v-model="content"
                            ref="myQuillEditor"
                            :options="editorOption"
                            @blur="onEditorBlur($event)" @focus="onEditorFocus($event)"
                            @change="onEditorChange($event)">
                    </quill-editor>
                </div>
            </el-form-item>
        </el-form>

    </el-card>
</template>

<script>
    import httpUtil from "../../util/HttpUtil.js";
    import { quillEditor } from 'vue-quill-editor'
    export default {
        name: "GoodsEdit",

        data(){

            /* 验证密码 */
            const validatePass2 = (rule, value, callback) => {
                if (value !== this.user.password) {
                    callback(new Error('两次输入密码不一致!'));
                } else {
                    callback();
                }
            };
            // 验证手机号是否存在
            const checkPhone = (rule, value, callback) => {
                // console.log(this.currPhone,'>>>>>',value);
                // 点击用户自己的手机号注册不做已经注册处理
                if (this.currPhone === value) {
                    callback();
                } else {
                    httpUtil.post(this, 'user', 'phoneIsExist', {"phone": value}, function (resp) {
                        if (resp.body.code === 0) {
                            console.log("okok");
                            callback();
                        } else {
                            callback(new Error('手机号已存在!'));
                        }
                    })
                }
            };

            return{
                content:null,
                editorOption:{},
                infoForm: {
                    a_title: '',
                    a_source: '',
                    a_content:'',
                    editorOption: {}
                },
                disable: false,
                coverUploadUrl: httpUtil.baseurl()+'goods/coverUpload',
                picturesUploadUrl: httpUtil.baseurl()+'goods/picturesUpload',
                coverUrl: httpUtil.baseurl()+'goods/cover/',
                picturesUrl: httpUtil.baseurl()+'goods/pictures/',
                loading:true,
                title: '',
                message: '',
                eqData: [],
                param:{},
                coverImages:[],
                picturesImages: [],
                userStatusSelect:{lable: '启用', value: 0},
                isShow: true,
                currPhone:'',  // 点击编辑后对应用户的手机号
                // enterpriseList:[],
                rules: {
                    username: [
                        {required: true, message: '请输入用户名', trigger: 'blur'},
                        {min: 2, max: 50, message: '长度在 2 到 50 个字符', trigger: 'blur'},
                        {validator: this.Validate.checkSpace, trigger: 'blur'}
                    ],
                    password: [
                        {required: true, message: '请输入密码', trigger: 'blur'},
                        {validator: this.Validate.checkPass, trigger: 'blur'},
                        {min: 2, max: 128, message: '长度在 2 到 128 个字符', trigger: 'blur'}
                    ],
                    confirmPassword: [
                        {required: true, message: '请再次输入密码', trigger: 'blur'},
                        {validator: validatePass2, trigger: ['blur', 'change']}
                    ],
                    phone: [
                        {required: true, message: '请输入手机号', trigger: 'blur'},
                        {max: 20, message: '长度最大为 20 个字符', trigger: 'blur'},
                        {validator: checkPhone, trigger: 'blur'},
                        {validator: this.Validate.checkIllegal, trigger: ['blur', 'change']},
                        //    { validator: this.Validate.checkSpace , trigger: ['blur', 'change']  }
                    ],
                    email: [
                        {required: true, message: '请输入邮箱地址', trigger: 'blur'},
                        {type: 'email', message: '请输入正确的邮箱地址', trigger: ['blur', 'change']}
                    ],
                    enterprise: [
                        {required: true, message: '请选择一个企业', trigger: 'blur'}
                    ],
                    authGroup: [
                        {required: true, message: '请选择权限组', trigger: 'blur'}
                    ],
                    status: [
                        {required: true, message: '请选择启用状态', trigger: 'blur'}
                    ]
                },
                goods:{

                }
            }
        },
        mounted(){
            this.titleSelect();

        },
        computed: {
            editor() {
                return this.$refs.myQuillEditor.quill
            }
        },

        methods:{
            handlePreview(){

            },
            handleRemove(){

            },
            onEditorBlur(){//失去焦点事件
            },
            onEditorFocus(){//获得焦点事件
            },
            onEditorChange(){//内容改变事件
            },
            coverSuccess(response, file, fileList){
                console.log("=====================")
                console.log(response)
                console.log(file)
                console.log(fileList)
                console.log("=====================")
                const data = JSON.parse(response.data);
                this.coverImages.push({
                    name:data.file,
                    url:this.coverUrl + data.file,
                });

            },
            picturesSuccess(response, file, fileList){
                console.log("=====================")
                console.log(response)
                console.log(file)
                console.log(fileList)
                console.log("=====================")
                this.picturesImages.push({
                    name:data.file,
                    url:this.coverUrl + data.file,
                });


            },
            editorOption(){

            },
            // 根据点击添加用户或者编辑用户，标题的替换。
            titleSelect() {
                const goodsId = sessionStorage.getItem("goodsIdEdit");
                console.log(goodsId)

                this.$set(this.$data.goods, 'goodsId', goodsId==='undefined'? null : goodsId);

                if (goodsId !== 'undefined') {
                    //this.$set(this.$data.user, 'uid', uid);
                    this.$set(this.$data,'title','编辑商品')
                    this.loadData();
                }else{
                    this.$set(this.$data,'title','添加商品')
                    this.$set(this.$data.goods,'goodsId',null)
                }

                // clear goodsIdEdit
                sessionStorage.setItem("goodsIdEdit", 'undefined');

            },
            // 企业关键词搜索，下拉
            loadAll() {
                //console.log('loadAll');
                const that = this;
                //console.log(this.$data.user.epShortname);
                if(this.$data.user.epShortname !== undefined && this.$data.user.epShortname.length > 0){
                    httpUtil.post(this, 'goods', "info", this.$data.goods.goodsId, function(resp) {
                        let epArr= JSON.parse(resp.body.data);
                        that.$set(that.$data, 'eqData', epArr);
                        console.log(that.eqData)
                        console.log(epArr)
                    })
                }
            },
            // 下拉选择某一项
            changeone(index) {
                this.$data.user.enterprise = this.eqData[index].eid;
                this.$data.user.epShortname = this.eqData[index].epShortName;
                this.$data.user.eid = this.eqData[index].eid;
                console.log(this.eqData)
                this.eqData = [];
            },
            // 提交按钮，针对添加用户和编辑用户的判断。
            onSubmit(formName) {
                if( this.$data.title === '编辑用户' ){
                    this.$data.user.password = 'default';
                    this.$data.user.confirmPassword = 'default';
                }
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        const uid = sessionStorage.getItem("userListUID");
                        console.log(uid);
                        console.log(this.$data.user);
                        const that = this;
                        // 判断是否存在uid来确定是添加还是编辑
                        // 添加用户
                        if (uid === 'undefined') {
                            httpUtil.post(this, 'user', 'addUser', this.$data.user, function (resp) {
                                console.log(resp)
                                const d2 = JSON.parse(resp.body.data);
                                console.log(">>>>>===")
                                console.log(d2);
                                that.$set(that.$data,'user', d2);
                                that.$set(that.$data.user,'epShortname', d2.enterpriseName);
                                if(resp.body.code === 0) {
                                    that.successMsg("添加用户成功");
                                    that.$set(that.$data,'user', {});
                                }
                            })
                        }else{
                            // 编辑用户
                            httpUtil.post(this, 'user', 'editUser', this.$data.user, function (resp) {
                                console.log(resp)
                                const d1 = JSON.parse(resp.body.data);
                                console.log(d1);
                                that.$set(that.$data,'user', d1);
                                that.$set(that.$data.user,'epShortname', d1.enterpriseName);
                                if(resp.body.code === 0) {
                                    that.successMsg("编辑用户成功")
                                }
                            })
                        }
                    } else {
                        return false;
                    }
                });

            },
            loadData(){
                const that = this;
                this.$set(this.$data, 'loading', true);
                const uid = sessionStorage.getItem("userListUID");
                httpUtil.post(this, 'user', "getUser", {uid:uid}, function (resp) {
                    const data = JSON.parse(resp.body.data);
                    console.log('loadData================')
                    console.log(data);
                    data.epShortname = data.enterpriseName
                    console.log(data)
                    that.$set(that.$data, "user", data);
                    that.$set(that.$data, 'loading', false);
                    that.$set(that.$data, 'disable', true)
                })
            },
            successMsg(value) {
                this.$message({
                    message: value,
                    type: 'success'
                });
            }
        }
    }
</script>

<style scoped>
    .spterp_info_item{
        margin: 20px;
    }
    .el-input{
        width: 200px;
    }
    #ul_eqShortname {
        display: block;
        list-style: none;
        padding: 0;
        margin-top: 0;
    }
    .li_eqShortname {
        font-size: 16px;
        cursor: pointer;
    }
</style>