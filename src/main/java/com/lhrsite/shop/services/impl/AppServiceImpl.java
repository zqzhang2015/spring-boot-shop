package com.lhrsite.shop.services.impl;

import com.lhrsite.shop.entity.App;
import com.lhrsite.shop.entity.User;
import com.lhrsite.shop.enums.ErrEumn;
import com.lhrsite.shop.exception.ErpException;
import com.lhrsite.shop.repository.AppRepository;
import com.lhrsite.shop.services.AppService;
import com.lhrsite.shop.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;


@Service
public class AppServiceImpl extends BaseServiceImpl implements AppService {
    private final UserService userService;

    private final AppRepository appRepository;
    @Autowired
    public AppServiceImpl(EntityManager entityManager, UserService userService,
                          AppRepository appRepository) {
        super(entityManager);
        this.userService = userService;
        this.appRepository = appRepository;
    }

    @Override
    public String getPicture() {
        App app = appRepository.findById(1).get();

        return app.getPicture();
    }

    @Override
    public String getLink() {
        App app = appRepository.findById(1).get();

        return app.getLink();
    }

    @Override
    public void edit(App app, String token) throws ErpException {
        User user = userService.tokenGetUser(token);
        if (user == null || user.getAdmin() != 1){
            throw new ErpException(ErrEumn.ONLY_ADMIN_CAN_DO);
        }
        app.setId(1);
        appRepository.save(app);
    }
}
