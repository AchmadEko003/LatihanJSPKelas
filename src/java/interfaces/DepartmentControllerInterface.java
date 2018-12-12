/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import java.util.List;

/**
 *
 * @author Genius
 */
public interface DepartmentControllerInterface {
    public List<Object> getAll(Object entity, String key);
    public List<Object> search(Object enitity, String key);
    public Object getById(Object entity, Object id);
    public boolean insert(String departmentId, String departmentName, String managerId, String locationId);
    public boolean update(String departmentId, String departmentName, String managerId, String locationId);
    public boolean delete(String id);
}
