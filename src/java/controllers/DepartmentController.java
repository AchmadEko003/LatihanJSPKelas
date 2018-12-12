/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.GeneralDAO;
import entities1.Department;
import entities1.Employee;
import entities1.Location;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.SessionFactory;
import interfaces.DepartmentControllerInterface;

/**
 *
 * @author Genius
 */
public class DepartmentController implements DepartmentControllerInterface {
    private SessionFactory factory;
    private GeneralDAO gdao;

    public DepartmentController() {
    }

    public DepartmentController(SessionFactory factory) {
        this.factory = factory;
        this.gdao = new GeneralDAO(factory);
    }
    
    @Override
    public List<Object> getAll(Object entity, String key) {
        List<Object> result = new ArrayList<>();
        result = gdao.doDDL(entity, key);
        return result;
    }

    @Override
    public List<Object> search(Object enitity, String key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object getById(Object entity, Object id) {
        return gdao.getById(entity, id);
    }

    @Override
    public boolean insert(String departmentId, String departmentName, String managerId, String locationId) {
        boolean result = false;
        Short idDepartment = Short.valueOf(departmentId);
        
        Employee employee = new Employee(Integer.parseInt(managerId));
        
        Location location = new Location(Short.valueOf(locationId));
        
        Object object = new Department(idDepartment,departmentName,employee,location);
        if (gdao.doDML(object, false)) {
            result = true;
        }
        return result;
    }

    @Override
    public boolean update(String departmentId, String departmentName, String managerId, String locationId) {
        boolean result = false;
        Short idDepartment = Short.valueOf(departmentId);
        
        String idm = managerId.substring(0, managerId.lastIndexOf(","));
        Employee employee = new Employee(Integer.parseInt(idm));
        
        String idl = locationId.substring(0, locationId.lastIndexOf(","));
        Location location = new Location(Short.valueOf(idl));
        
        Object object = new Department(idDepartment,departmentName,employee,location);
        if (gdao.doDML(object, false)) {
            result = true;
        }
        return result;
    }

    @Override
    public boolean delete(String id) {
        boolean result = false;
        Short idDepartment = Short.valueOf(id);
        Object object = new Department(idDepartment, "");
        if (gdao.doDML(object, true)) {
            result = true;
        }
        return result;
    }
}
