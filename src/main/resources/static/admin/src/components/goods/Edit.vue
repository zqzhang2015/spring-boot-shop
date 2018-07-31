<template>
    <el-card class="box-card">
        <div slot="header" class="clearfix">
            <span>{{title}}</span>
            <!--<el-button style="float: right; padding: 3px 0" type="text">编辑</el-button>-->
        </div>

        <el-form ref="goods" :model="goods" label-width="80px" >
            <el-form-item label="商品标题" >
                <el-input size="mini" v-model="goods.title" placeholder="请输入商品标题"></el-input>
            </el-form-item>
            <el-form-item label="商品描述" >
                <el-input size="mini" v-model="goods.describe" style="width: 200px" type="textarea" placeholder="请输入商品描述"></el-input>
            </el-form-item>
            <el-form-item label="原价" >
                <el-input size="mini" v-model="goods.originalPrice" type="text" placeholder="请输入原价"></el-input>
            </el-form-item>
            <el-form-item label="活动价" >
                <el-input size="mini" v-model="goods.salePrice" placeholder="请输入活动价"></el-input>
            </el-form-item>
            <el-form-item label="开启活动" >
                <el-switch size="mini" v-model="goods.saleStatusShow"></el-switch>
            </el-form-item>
            <el-form-item label="上架" >
                <el-switch size="mini" v-model="goods.statusShow"></el-switch>
            </el-form-item>
            <!--<el-form-item label="启用状态" >-->
                <!--<el-select size="mini" v-model="user.status" placeholder="请选择状态">-->
                    <!--<el-option label="启用" :value="0"></el-option>-->
                    <!--<el-option label="禁用" :value="1"></el-option>-->
                <!--</el-select>-->
            <!--</el-form-item>-->
            <el-form-item label="库存" >
                <el-input size="mini" v-model="goods.stock" placeholder="库存"></el-input>
            </el-form-item>
            <el-form-item label="发货地" >
                <el-input size="mini" v-model="goods.deliveryPlace" placeholder="发货地"></el-input>
            </el-form-item>
            <el-form-item label="快递费" >
                <el-input size="mini" type="number" v-model="goods.despatchMoney" placeholder="快递费"></el-input>
            </el-form-item>

            <el-form-item label="商品封面" >
                <el-upload
                        class="upload-demo"
                        :action="coverUploadUrl"
                        :on-preview="handlePreview"
                        :on-remove="handleCoverImagesRemove"
                        :on-success="coverSuccess"
                        :file-list="coverImages"
                        :multiple="false"
                        :before-upload="beforeCoverUpload"
                        list-type="picture-card">
                    <img v-if="imageUrl" :src="imageUrl" class="avatar">
                    <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                    <!--<el-button size="small" type="primary">点击上传</el-button>-->
                    <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>
                </el-upload>
            </el-form-item>
            <el-form-item label="轮播图" >
                <el-upload
                        class="upload-demo"
                        :action="picturesUploadUrl"
                        :on-preview="handlePreview"
                        :on-remove="handlePicturesImagesRemove"
                        :on-success="picturesSuccess"
                        :file-list="picturesImages"
                        :before-upload="beforePicturesUpload"
                        list-type="picture-card">
                    <img v-if="imageUrl" :src="imageUrl" class="avatar">
                    <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                    <!--<el-button size="small" type="primary">点击上传</el-button>-->
                    <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>
                </el-upload>
            </el-form-item>
            <el-form-item label="商品详情" >
                <div class="edit_container">
                    <quill-editor
                            v-model="goods.content"
                            ref="qe"
                            :options="editorOption"
                            @blur="onEditorBlur($event)" @focus="onEditorFocus($event)"
                            @change="onEditorChange($event)">
                    </quill-editor>
                </div>
            </el-form-item>
            <el-form-item size="small">
                <el-button type="primary" size="mini" @click="onSubmit(goods)">提交</el-button>
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
                imageUrl: '',
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
                goods:{
                    title:"",
                    describe:"",
                    originalPrice: 0.00,
                    salePrice: 0.00,
                    saleStatus: 1,
                    saleStatusShow:false,
                    status: 0,
                    statusShow: true,
                    stock: 0,
                    deliveryPlace: "本地",
                    despatchMoney:0.00,
                    coverImages:"",
                    cover: '',
                    pictures:'',
                    picturesImages:[],
                    content:'',
                }
            }
        },
        mounted(){
            // this.titleSelect();
            this.titleSelect()
            const  cacheGoods = sessionStorage.getItem("cacheGoods");
            console.log("cacheGoods:"+cacheGoods)
            if(cacheGoods !== null && cacheGoods !== ""){
                this.$set(this.$data, "goods", JSON.parse(cacheGoods))
                this.$set(this.$data, "picturesImages", this.$data.goods.picturesImages)
                this.$set(this.$data, "coverImages", this.$data.goods.coverImages)
            }
        },
        computed: {
            editor() {
                return this.$refs.myQuillEditor.quill
            }
        },

        methods:{
            beforePicturesUpload(file) {
                return this.imgUploadRule(file)
            },
            beforeCoverUpload(file) {
                //当封面有一张上传的图片时禁止上传
                if (this.coverImages.length >= 1){
                    this.$message.error('封面只能上传一张！');
                    return false;
                }
                return this.imgUploadRule(file)
            },

            imgUploadRule(file){
                const isImage = file.type === 'image/png' || file.type === 'image/jpeg';
                const isLt10M = file.size / 1024 / 1024 < 10;

                if (!isImage) {
                    this.$message.error('上传头像图片只能是 JPG 格式!');
                }
                if (!isLt10M) {
                    this.$message.error('上传头像图片大小不能超过 10MB!');
                }
                return isImage && isLt10M;
            },


            handlePreview(){

            },
            handleCoverImagesRemove(file, fileList){
                const list = []
                for (var i = 0; i < fileList.length; i++){
                    if(fileList[i].uid !== file.uid){
                        list.push(fileList[i])
                    }
                }
                this.$set(this.$data, "coverImages", list);
                this.$set(this.$data.goods, "coverImages", list);
            },
            handlePicturesImagesRemove(file, fileList){
                const list = []
                for (var i = 0; i < fileList.length; i++){
                    if(fileList[i].uid !== file.uid){
                        list.push(fileList[i])
                    }
                }
                this.$set(this.$data, "picturesImages", list);
                this.$set(this.$data.goods, "picturesImages", list);
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
                const data = JSON.parse(response.data);

                this.picturesImages.push({
                    name:data.file,
                    url:this.picturesUrl + data.file,
                });


            },
            editorOption(){

            },
            // 根据点击添加用户或者编辑用户，标题的替换。
            titleSelect() {
                const goodsId = sessionStorage.getItem("goodsIdEdit");
                console.log("goodsId:"+goodsId)

                this.$set(this.$data.goods, 'goodsId', goodsId==='undefined'? null : goodsId);

                if (goodsId !== 'undefined' && goodsId !== '' && goodsId !== undefined) {
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
            onSubmit(goods) {
                // 缓存表单，如果出现提交失败还原表单
                console.log(this.picturesImages)
                this.$set(this.$data.goods,"coverImages", this.coverImages);
                this.$set(this.$data.goods,"picturesImages", this.picturesImages);
                this.$set(this.$data.goods,"saleStatus", this.$data.goods.saleStatusShow?0:1)
                this.$set(this.$data.goods,"status", this.$data.goods.statusShow?0:1)
                this.$set(this.$data.goods,"cover", this.$data.goods.coverImages[0].url);
                this.$set(this.$data.goods,"pictures", JSON.stringify(this.$data.goods.picturesImages))
                this.$set(this.$data.goods,"updateUser", this.$store.getters.user.uid)


                // this.$set(this.$data.goods,"content", this.$refs.qe.editor.getContents())


                const cacheGoods = JSON.stringify(this.goods);
                console.log("cacheGoods:" + cacheGoods);
                sessionStorage.setItem("cacheGoods", cacheGoods);
                console.log(this.goods)

                const that = this;
                httpUtil.post(this, 'goods', 'add', this.$data.goods, function (resp) {
                    console.log(resp);
                    that.successMsg("添加成功！")
                    // 添加成功清楚缓存
                    sessionStorage.setItem("cacheGoods","");
                })
            },
            loadData(){
                const that = this;
                this.$set(this.$data, 'loading', true);
                const goodsIdEdit = sessionStorage.getItem("goodsIdEdit");
                httpUtil.post(this, 'goods', "info", {goodsId:goodsIdEdit}, function (resp) {
                    const data = JSON.parse(resp.body.data);
                    that.$set(that.$data, "goods", data)
                    const coverD = [{'url':data.cover,'uid':new Date().getTime(), 'name':'封面'}];
                    const pictureD = JSON.parse(data.pictures);
                    that.$set(that.$data, "coverImages", coverD)
                    that.$set(that.$data.goods,"coverImages", coverD);
                    that.$set(that.$data, "picturesImages", pictureD)
                    that.$set(that.$data.goods,"picturesImages", pictureD);
                    that.$set(that.$data.goods,"saleStatusShow", that.$data.goods.saleStatus === 0)
                    that.$set(that.$data.goods,"statusShow", that.$data.goods.status === 0)
                    that.$set(that.$data.goods,"updateUser", that.$store.getters.user.uid)
                    console.log(that);



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