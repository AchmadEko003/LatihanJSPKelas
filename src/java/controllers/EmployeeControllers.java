/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAOInterface;
import daos.GeneralDAO;
import entities.Departments;
import entities.Employees;
import entities.Jobs;
import interfaces.EmployeeInterface;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import org.hibernate.SessionFactory;

/**
 *
 * @author Nitani
 */
public class EmployeeControllers implements EmployeeInterface {

    private SessionFactory factory;
    private GeneralDAO gdao = new GeneralDAO(factory);
    private DAOInterface daoid = new GeneralDAO(factory);

    public EmployeeControllers(SessionFactory factory) {
        this.factory = factory;
        this.gdao = new GeneralDAO(factory);
        this.daoid = new GeneralDAO(factory);
    }

    public EmployeeControllers() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Object> search(String keyword) {
        return this.daoid.doDDL(new Employees(), keyword);
    }

    @Override
    public Object getById(Object id) {
        return this.daoid.getById(new Employees(), id);
    }

    @Override
    public Boolean insert(String employeeId, String firstName, String lastName, String email, String phoneNumber, String hireDate, String jobId, String salary, String commissionPct, String managerId, String departmentId) {
        boolean hasil = false;
        try {
            DateFormat format = new SimpleDateFormat("dd/MM/yyyy", Locale.ENGLISH);
            Date dates = format.parse(hireDate);
            int employeeid = Integer.valueOf(employeeId);
            short sal = Short.valueOf(salary);
            BigDecimal com = new BigDecimal(commissionPct);
            int managerid = Integer.valueOf(managerId);
            Employees emp = new Employees(managerid);
            Jobs job = new Jobs(jobId);
            Departments department = new Departments(Short.valueOf(departmentId));
            Employees employee = new Employees(employeeid, firstName, lastName, email, phoneNumber, dates, job, sal, com, emp, department);
            if (daoid.doDML(employee, false)) {
                hasil = true;
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return hasil;
    }

    @Override
    public Boolean delete(String employeeId) {
        Employees emp = new Employees(Integer.valueOf(employeeId));
        return daoid.doDML(emp, true);
    }

    @Override
    public List<Object> jobId(String keyword) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Object> departmentId(String keyword) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
