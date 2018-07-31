const httpUtil = {
    baseurl(name){
        const baseHost = "http://192.168.31.8:8088/";
        switch (name){
            case 'home':
                return baseHost;
            case 'user':
                return baseHost + 'user/';
            case 'enterprise':
                return baseHost + 'enterprise/';
            case 'auth':
                return baseHost + 'auth/';
            case 'goods':
                return baseHost + 'goods/';
            default:
                return baseHost
        }

    },

    get(that, apiPath, url, callback){
        console.log(this.baseurl(apiPath) + url);
        that.$http.get(this.baseurl(apiPath) + url).then(response=>{
                //console.log("response => "+response)
                if(response.status !== 200){
                    that.$notify.error({
                        title: '失败',
                        message: '错误代码:' + response.status
                            + '服务器未正常处理请求！',
                    });
                    return;
                }else if(response.body.code !== 0){
                    that.$notify.error({
                        title: '失败',
                        message: '错误代码:' + response.body.code
                            + response.body.msg,
                    });
                    return;
                }
                callback(response)
            }, response=>{
                that.$notify.error({
                    title: '失败',
                    message: '错误代码:' + response.status
                        + '与服务器建立连接失败！',
                });
                // callback(response)
            })
    },
    post(that, apiPath, url, param, callback){
        if (param.token === undefined){
            param.token = that.$store.getters.user.token
        }
        console.log(param)
        that.$http.post(this.baseurl(apiPath) + url, param, {emulateJSON:true})
            .then(response=>{
                // console.log("response.status => "+response.status )
                if(response.status !== 200){
                    that.$notify.error({
                        title: '失败',
                        message: '错误代码:' + response.status
                            + '服务器未正常处理请求！',
                    });
                    return;
                }else if(response.body.code !== 0){
                    that.$notify.error({
                        title: '失败',
                        message: '错误代码:' + response.body.code
                            + response.body.msg,
                    });
                    return;
                }
                callback(response)
            },response=>{
                that.$notify.error({
                    title: '失败',
                    message: '错误代码:' + response.status
                        + '与服务器建立连接失败！',
                });
                // callback(response)
            })
    }


};

export default httpUtil;