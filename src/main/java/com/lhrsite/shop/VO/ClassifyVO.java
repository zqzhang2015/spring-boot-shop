package com.lhrsite.shop.VO;


import com.lhrsite.shop.entity.Classify;
import lombok.Data;
import org.springframework.beans.BeanUtils;

import java.util.ArrayList;
import java.util.List;

@Data
public class ClassifyVO {

    private Integer clId;
    private String clName;
    private Integer clGrade;
    private Integer clFid;
    private Integer value;
    private String label;
    private List<ClassifyVO> children = new ArrayList<>();


    public static ClassifyVO init(Classify classify){
        ClassifyVO classifyVO = new ClassifyVO();
        BeanUtils.copyProperties(classify, classifyVO);
        classifyVO.setValue(classify.getClId());
        classifyVO.setLabel(classify.getClName());
        return classifyVO;
    }

    public static List<ClassifyVO> init(List<Classify> classifies){
        List<ClassifyVO> classifyVOS = new ArrayList<>();
        classifies.forEach(classify -> {
            classifyVOS.add(ClassifyVO.init(classify));
        });
        return classifyVOS;
    }

}
