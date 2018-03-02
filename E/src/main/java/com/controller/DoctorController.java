package com.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.dao.IDoctorDao;
import com.entity.Doctor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.print.Doc;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("doctor")
@Controller
public class DoctorController {


    @Autowired
    private IDoctorDao iDoctorDao;

    @RequestMapping("addone")
    public void adddoctor(HttpServletRequest request,HttpServletResponse response) throws IOException {
        //ת转码
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        //得到参数：
        String str=request.getParameter("str");
        //转为doctor对象：
        Doctor doctor=JSON.parseObject(str,Doctor.class);
      //  System.out.println(doctor.getGhfy()+","+doctor.getAddress());
        iDoctorDao.adddoctor(doctor);
        PrintWriter out=response.getWriter();
        //添加成功 返回:
        out.write("1");
        out.flush();
        out.close();
    }

    @RequestMapping("updateone")
    public void updatedoctor(HttpServletRequest request,HttpServletResponse response) throws IOException {
        //ת转码
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        //得到参数：
        String str=request.getParameter("str");
        int doctor_id= Integer.parseInt(request.getParameter("doctor_id"));

        System.out.println("id是"+doctor_id+",后面就是字符串："+str);
        //找到要修改的对象：
        Doctor oldDoctor=iDoctorDao.getDoctorById(doctor_id);
        //转为doctor对象：(新的对象)
        Doctor newdoctor=JSON.parseObject(str,Doctor.class);
        //新旧转换：
        oldDoctor.setKsm(newdoctor.getKsm());
        oldDoctor.setName(newdoctor.getName());
        oldDoctor.setSex(newdoctor.getSex());
        oldDoctor.setBirthday(newdoctor.getBirthday());
        oldDoctor.setAddress(newdoctor.getAddress());
        oldDoctor.setSfz(newdoctor.getSfz());
        oldDoctor.setPhone(newdoctor.getPhone());
        oldDoctor.setGhfy(newdoctor.getGhfy());
        oldDoctor.setGzl(newdoctor.getGzl());
        oldDoctor.setCzsj(newdoctor.getCzsj());
        oldDoctor.setHyzt(newdoctor.getHyzt());
        oldDoctor.setXl(newdoctor.getXl());
        oldDoctor.setDqrs(newdoctor.getDqrs());
        oldDoctor.setIsok(newdoctor.getIsok());
        //修改:
        iDoctorDao.updatedoctor(oldDoctor);
        PrintWriter out=response.getWriter();
        //添加成功 返回:
        out.write("1");
        out.flush();
        out.close();
    }

    //删除：
    @RequestMapping("deldoctor")
    public void delPerson(HttpServletResponse resp, HttpServletRequest request) throws IOException {

        //得到传过来的字符串：
        String str=request.getParameter("str");
        //将字符串转化为数组：
        JSONArray jsons=JSONArray.parseArray(str);
        for (Object object : jsons) {
            int id=Integer.parseInt(object.toString());
            System.out.println(id);
            iDoctorDao.deldoctor(id);
        }
        //返回：
        PrintWriter out=resp.getWriter();
        out.write("1");
        out.flush();
        out.close();

    }

       @RequestMapping("getsecondall")
       public void getall(HttpServletRequest request, HttpServletResponse response) throws IOException {
           //获得参数：
           int pageSize = Integer.parseInt(request.getParameter("pageSize"));
           int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));

           System.out.println("页数分别是："+pageNumber+","+pageSize);
           //得到查询的参数：
           String name=request.getParameter("name");
           name=new String(name.getBytes("iso-8859-1"),"utf-8");
           String sex=request.getParameter("sex");
           sex=new String(sex.getBytes("iso-8859-1"),"utf-8");
           String ksm=request.getParameter("ksm");
           ksm=new String(ksm.getBytes("iso-8859-1"),"utf-8");

           System.out.println("姓名"+name+",性别："+sex+",科室名："+ksm);

           int offset=(pageNumber-1)*pageSize;  //当前起始页
           //定义map集合：
           Map mp=new HashMap();
           //分页：
           mp.put("offset",offset);
           mp.put("pageSize",pageSize);
           if(name.length()>0){
               mp.put("name",name);
           }
           if(sex.length()>0){
               mp.put("sex",sex);
           }
           if(ksm.length()>0){
               mp.put("ksm",ksm);
           }
           //调用接口：
           List<Doctor> la=iDoctorDao.getallDoctor(mp);
           Map<String, Object> map = new HashMap<String, Object>();
           map.put("total",la.size());
           map.put("rows",la);
           PrintWriter out=response.getWriter();
           String s= JSON.toJSONString(map);
            System.out.println("查询后的数据："+s);
           out.write(s);
           out.flush();
           out.close();
       }





}
