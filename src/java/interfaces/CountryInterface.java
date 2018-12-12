/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import java.math.BigDecimal;
import java.util.List;
import org.hibernate.SessionFactory;

/**
 *
 * @author Nitani
 */
public interface CountryInterface {
    public List<Object> search(String keyword);

    public Object getById(Object id);

    public boolean insert(String countryId, String countryName, String regId);

    public String update(String id, String name, String regionId);

    public boolean delete(String countryId);

    public List<Object> getAll();
 
   public Object getByIdCountry(String id);
       
    
    
}
