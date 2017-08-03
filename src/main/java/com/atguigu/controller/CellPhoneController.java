package com.atguigu.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.pojo.Cellphone;
import com.atguigu.service.PhoneService;
import com.github.pagehelper.Page;

@Controller
public class CellPhoneController {
    
    @Autowired
   PhoneService phoneService;
   
    /**
     * 
     * @Description 查询到所有手机的列表
     * @return
     */
    @ResponseBody
    @RequestMapping("/list")
    public List<Cellphone> listRole(){
       System.out.println("helllo");
       
        List<Cellphone> list = phoneService.list();
       return list;
    }
    
    
    /**
     * 
     * @Description 保存手机
     * @param phone
     */
    @ResponseBody
    @RequestMapping("/save")
    public void save(Cellphone phone){
       System.out.println("helllo save");
       phoneService.save(phone); 
    }
    
    @ResponseBody
    @RequestMapping("/update")
    public void update(Cellphone phone){
       System.out.println("helllo update");
       phoneService.update(phone); 
       System.out.println("git test");
    }
    
    
    @RequestMapping("/delete/{phoneId}")
    public void removeEmp(@PathVariable("phoneId") Integer phoneId, HttpServletResponse response) throws IOException {
        
        phoneService.delete(phoneId);
        
        response.getWriter().write("success");
    }
    
    @ResponseBody
    @RequestMapping("/pagelist")
    public Map<String, Object> getEmpPageRemote(@RequestParam(value= "page",defaultValue="1" ) int pageNum, @RequestParam(value="rows",defaultValue="5") int pageSize) {
        System.out.println("hello page");
        List<Cellphone> list = phoneService.getPhonePageList(pageNum, pageSize);
        
        Page<Cellphone> page = (Page<Cellphone>) list;
        
        //获取总记录数
        long total = page.getTotal();
        
        //创建Map对象用来存放响应数据
        Map<String, Object> jsonMap = new HashMap<>();
        jsonMap.put("total", total);
        jsonMap.put("rows", list);
        
        return jsonMap;
    }

}
