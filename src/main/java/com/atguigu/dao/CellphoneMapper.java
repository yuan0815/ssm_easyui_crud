package com.atguigu.dao;

import com.atguigu.pojo.Cellphone;
import com.atguigu.pojo.CellphoneExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CellphoneMapper {
    long countByExample(CellphoneExample example);

    int deleteByExample(CellphoneExample example);

    int deleteByPrimaryKey(Integer phoneId);

    int insert(Cellphone record);

    int insertSelective(Cellphone record);

    List<Cellphone> selectByExample(CellphoneExample example);

    Cellphone selectByPrimaryKey(Integer phoneId);

    int updateByExampleSelective(@Param("record") Cellphone record, @Param("example") CellphoneExample example);

    int updateByExample(@Param("record") Cellphone record, @Param("example") CellphoneExample example);

    int updateByPrimaryKeySelective(Cellphone record);

    int updateByPrimaryKey(Cellphone record);

    List<Cellphone> selectAll();
}