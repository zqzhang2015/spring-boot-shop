package com.lhrsite.shop.enums;

public enum ErrEumn {
    USER_NO_EXIT(-10000, "用户不存在"),
    ADD_USER_ERR(-10001, "添加用户失败"),
    UPDATE_USER_PARAMS_ERR(-10002, "修改用户-非法参数"),
    UPDATE_USER_ERR(-10003, "修改用户-非法参数"),
    DELECT_USER_ERR(-10004, "删除用户失败"),
    LOGIN_ERR(-10005, "用户名或密码错误"),
    EXPIRE_TOKEN(-10006, "身份认证过期,请重新登录"),
    PARAM_IS_NULL(-10007, "参数为空"),

    ADD_USER_UID_IS_NULL(-10008, "uid不能为空！"),
    ADD_USER_PASSWORD_IS_NULL(-10008, "密码不能为空！"),
    ADD_USER_USERNAME_IS_NULL(-10009, "用户名不能为空！"),
    ADD_USER_PHONE_IS_NULL(-10010, "手机号不能为空！"),
    ADD_USER_STATUS_IS_NULL(-10011, "状态不能为空！"),
    ADD_USER_ENTERPRISE_IS_NULL(-10012, "企业不能为空！"),
    ADD_USER_IS_NULL(-10012, "添加用户对象为空！"),


    AUTH_GROUP_NULL(-10015, "权限组对象为空！"),
    ENTERPRISE_NULL(-10016, "企业id为空！"),
    UPDATEUSER_NULL(-10017, "更新用户为空！"),
    AUTH_GROUP_NAME_NULL(-10018, "权限组名称为空！"),

    EDIT_AUTH_GROUP_ERROR(-10013, "编辑权限组失败！"),


    TOKEN_IS_NULL(-10014, "token为空！"),


    ADD_ENTERPRISE_NULL(-10019, "企业对象不能为空！"),
    ADD_ENTERPRISE_SHORT_NAME_NULL(-10020, "企业简称不能为空！"),
    ADD_ENTERPRISE_NAME_NULL(-10021, "企业名称不能为空！"),


    ADD_USER_PHONE_EXIST(-10022, "手机号已注册！"),


    UPLOAD_ERROR_FILE_NULL(-100023, "文件不能为空"),
    UPLOAD_ERROR(-100023, "上传文件失败"),


    CLASSIFY_IS_NOTEXIT(-100024, "分类不存在！"),

    BUY_CAR_IS_NULL(-100025, "购物车空空如也！");


    ;


    private Integer code;
    private String message;

    public Integer getCode() {
        return code;
    }


    public String getMessage() {
        return message;
    }

    ErrEumn(Integer code, String message){
        this.message = message;
        this.code = code;
    }

}
