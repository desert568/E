package com.dao;

import com.entity.Doctor;

import javax.print.Doc;
import java.util.List;
import java.util.Map;

public interface IDoctorDao {


    public List<Doctor> getallDoctor(Map map);

    public List<Doctor> getall();

    public Doctor getDoctorById(int id);

    public void deldoctor(int id);

    public void adddoctor(Doctor doctor);

    public void updatedoctor(Doctor doctor);

}
