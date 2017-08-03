package com.atguigu.service;

import java.util.List;

import com.atguigu.pojo.Cellphone;


public interface PhoneService {

    List<Cellphone> list();

    void save(Cellphone phone);

    void update(Cellphone phone);

    void delete(Integer phoneId);

    List<Cellphone> getPhonePageList(int pageNum, int pageSize);

}
