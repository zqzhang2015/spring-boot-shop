package com.lhrsite.shop.services.impl;

import com.lhrsite.shop.VO.ClassifyVO;
import com.lhrsite.shop.entity.Classify;
import com.lhrsite.shop.entity.QClassify;
import com.lhrsite.shop.enums.ErrEumn;
import com.lhrsite.shop.exception.ErpException;
import com.lhrsite.shop.repository.ClassifyRepository;
import com.lhrsite.shop.services.ClassifyService;
import com.querydsl.jpa.impl.JPAQueryFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class ClassifyServiceImpl extends BaseServiceImpl implements ClassifyService {

    private final ClassifyRepository classifyRepository;
    private JPAQueryFactory queryFactory;

    @Autowired
    public ClassifyServiceImpl(EntityManager entityManager, ClassifyRepository classifyRepository) {
        super(entityManager);
        this.classifyRepository = classifyRepository;
        queryFactory = getQueryFactory();
    }

    @Override
    public List<ClassifyVO> getClassifyTree() {

        QClassify qClassify = QClassify.classify;

        List<Classify> classifies = queryFactory.selectFrom(qClassify)
                .orderBy(qClassify.clGrade.desc())
                .where(qClassify.clDel.eq(0))
                .fetch();

        List<ClassifyVO> classifyVOS = ClassifyVO.init(classifies);

        List<ClassifyVO> resultVO = new ArrayList<>();

        classifyToVO(classifyVOS, resultVO);

        return resultVO;
    }

    @Override
    public List<ClassifyVO> getFClassify() {
        QClassify qClassify = QClassify.classify;
        List<Classify> classifies = queryFactory.selectFrom(qClassify)
                .orderBy(qClassify.clGrade.desc())
                .where(qClassify.clDel.eq(0))
                .where(qClassify.clFid.eq(0))
                .fetch();
        List<ClassifyVO> classifyVOS = ClassifyVO.init(classifies);

        List<ClassifyVO> resultVO = new ArrayList<>();

        classifyToVO(classifyVOS, resultVO);
        return resultVO;
    }

    private void classifyToVO(List<ClassifyVO> classifyVOS, List<ClassifyVO> resultVO) {
        classifyVOS.forEach(classifyVO -> {
            if (classifyVO.getClGrade() == 0){
                resultVO.add(classifyVO);
            }else{
                classifyVOS.forEach(classifyVO1 -> {
                    if (classifyVO1.getClId().equals(classifyVO.getClFid())){
                        classifyVO1.getChildren().add(classifyVO);
                    }
                });
            }

        });
    }

    @Override
    public Classify add(Classify classify) throws ErpException {
        // 判断是否存在
        QClassify qClassify = QClassify.classify;

        Classify existClassify = queryFactory.selectFrom(qClassify)
                .where(
                        qClassify.clDel.eq(0)
                        .and(qClassify.clName.eq(classify.getClName()))
                ).fetchOne();
        if (existClassify != null){
            throw new ErpException(ErrEumn.CLASSIFY_IS_EXIST);
        }

        return classifyRepository.save(classify);
    }

    @Override
    public Classify update(Classify classify) {
        return classifyRepository.save(classify);
    }

    @Override
    public Classify findById(Integer clId) throws ErpException {
        Optional<Classify> classifyOptional = classifyRepository.findById(clId);
        if (! classifyOptional.isPresent()){
            throw new ErpException(ErrEumn.CLASSIFY_IS_NOTEXIST);
        }
        return classifyOptional.get();
    }

    @Override
    public void del(Integer clId) throws ErpException {
        Classify classify = findById(clId);
        classify.setClDel(1);
        classifyRepository.save(classify);
    }
}
