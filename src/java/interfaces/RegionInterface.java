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
public interface RegionInterface {
    public List<Object> search(String keyword);
    public Boolean insert(String regionId, String regionName);
    public Boolean delete(String id);
    public Object getById(Object id);
}
