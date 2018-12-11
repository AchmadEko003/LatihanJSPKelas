/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import java.util.List;

/**
 *
 * @author Nitani
 */
public interface EmployeeInterface {

    public List<Object> search(String keyword);

    public Object getById(Object id);

    public Boolean insert(String employeeId, String firstName, String lastName, String email, String phoneNumber, String hireDate, String jobId, String salary, String commissionPct, String managerId, String departmentId);

    public Boolean delete(String employeeId);

    public List<Object> jobId(String keyword);

    public List<Object> departmentId(String keyword);
}
