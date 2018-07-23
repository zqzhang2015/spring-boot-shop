package com.lhrsite.shop.services;

import com.lhrsite.shop.exception.ErpException;
import com.lhrsite.shop.VO.PageVO;
import com.lhrsite.shop.VO.UserVO;
import com.lhrsite.shop.entity.User;

import javax.servlet.http.HttpServletRequest;

/**
 * 用户服务
 * @author lhr
 */
public interface UserService {


    UserVO login(String phoneNumber, String password,
                 HttpServletRequest request) throws ErpException;

    /**
     * use token get user object
     * @param token The token obtained by the user login
     * @return      user data
     * @throws ErpException
     */
    UserVO tokenCanUse(String token) throws ErpException;


    /**
     * get user list ande select user list
     * @param user you can use username, phone, email, enterpriseId query,
     *             and username,phone, email is "like query"
     *
     * @param page page number, page size default 10
     *
     * @return     UserVO list and pagination data
     */
    PageVO<UserVO> getUser(User user, int page, int pageSize);


    UserVO findUserById(Integer userId, boolean showPhoneNumber) throws ErpException;

    User findById(Integer userId);

    User addUser(User user) throws ErpException;

    UserVO updateUser(User user) throws ErpException;

    UserVO delUser(User user) throws ErpException;

    User tokenGetUser(String token);

    void phoneIsExist(String phone) throws ErpException;

}
