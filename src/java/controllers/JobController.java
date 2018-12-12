/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAOInterface;
import daos.GeneralDAO;
import entities.Jobs;
import interfaces.JobInterface;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.SessionFactory;

/**
 *
 * @author Igaz
 */
public class JobController implements JobInterface{

    private SessionFactory factory;
    private GeneralDAO gdao;
    private DAOInterface daoi = new GeneralDAO(factory);

    public JobController(SessionFactory factory) {
        this.factory = factory;
        this.daoi = new GeneralDAO(factory);
        this.gdao = new GeneralDAO(factory);
    }
    
    
    
    @Override
    public boolean insertOrUpdate(String id, String nama, String minSalary, String maxSalary) {
        boolean hasil = false;
        try {
            int salaryMax = Integer.parseInt(maxSalary);
            int salaryMin = Integer.parseInt(minSalary);
            Jobs job = new Jobs(id, nama, salaryMin, salaryMax);
            if (daoi.doDML(job, false)) {
                hasil = true;
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return hasil;
    }
    
    public boolean delete(String id, String nama) {
        boolean hasil = false;
        try {
            Jobs job = new Jobs(id, nama);
            if (daoi.doDML(job, true)) {
                hasil = true;
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return hasil;
    }

    @Override
    public List<Object> getAllData() {
        List<Object> data = new ArrayList<>();
        data = gdao.doDDL(new Jobs(), "");
        return data;
    }

    @Override
    public Object getById(Object entity, Object id) {
        return gdao.getById(entity, id);
    }

    @Override
    public List<Object> search(String keyword) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean insertOrUpdateOrDelete(Object object, boolean isDelete) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
