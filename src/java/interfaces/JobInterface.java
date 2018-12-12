/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import java.util.List;

/**
 *
 * @author Igaz
 */
public interface JobInterface {
    public boolean insertOrUpdateOrDelete(Object object,
            boolean isDelete);
    
    public boolean insertOrUpdate(String id, String nama, String minSalary, String maxSalary);
    
    public boolean delete(String id, String nama);

    public List<Object> getAllData();

    public Object getById (Object entity, Object id);
    
    public List<Object> search(String keyword);
}
