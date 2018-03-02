package com.controller;

import com.alibaba.fastjson.JSON;
import com.dao.IKeshiDao;
import com.entity.Keshi;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.MalformedParameterizedTypeException;
import java.util.HashMap;
import java.util.Map;

@RequestMapping("keshi")
@Controller
public class KeshiController {

    @Autowired
    private IKeshiDao ikeshiDao;

    @ResponseBody
    @RequestMapping("getKeshi")
     public Map<String, Object>  getKeshi(HttpServletResponse response) throws IOException {

     //   System.out.println("来了");

//        for (Keshi keshi : ikeshiDao.getall()) {
//            System.out.println(keshi);
//        }

        Map<String,Object> map=new HashMap<String, Object>();
        map.put("data",ikeshiDao.getall());
        map.put("size",ikeshiDao.getall().size());
        return map;
     }




}
