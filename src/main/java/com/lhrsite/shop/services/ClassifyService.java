package com.lhrsite.shop.services;

import com.lhrsite.shop.VO.ClassifyVO;
import com.lhrsite.shop.entity.Classify;
import com.lhrsite.shop.exception.ErpException;

import java.util.List;

public interface ClassifyService {

    List<ClassifyVO> getClassifyTree();
    List<ClassifyVO> getFClassify();

    Classify add(Classify classify) throws ErpException;

    Classify update(Classify classify);
    Classify findById(Integer clId) throws ErpException;


    void del(Integer clId) throws ErpException;

}
