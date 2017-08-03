package com.atguigu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.dao.CellphoneMapper;
import com.atguigu.pojo.Cellphone;
import com.atguigu.service.PhoneService;
import com.github.pagehelper.PageHelper;

@Service
public class PhoneServiceImpl implements PhoneService {

    @Autowired
    CellphoneMapper cellphoneMapper;

    @Override
    public List<Cellphone> list() {

        return cellphoneMapper.selectByExample(null);
    }

    @Override
    public void save(Cellphone phone) {
        cellphoneMapper.insertSelective(phone);
    }

    @Override
    public void update(Cellphone phone) {
        cellphoneMapper.updateByPrimaryKeySelective(phone);
    }

    @Override
    public void delete(Integer phoneId) {
        cellphoneMapper.deleteByPrimaryKey(phoneId);
    }

    @Override
    public List<Cellphone> getPhonePageList(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);

        return cellphoneMapper.selectAll();
    }

}
