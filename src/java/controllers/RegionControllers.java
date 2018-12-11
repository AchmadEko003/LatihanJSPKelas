/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAOInterface;
import daos.GeneralDAO;
import entities.Regions;
import interfaces.RegionInterface;
import java.math.BigDecimal;
import java.util.List;
import org.hibernate.SessionFactory;

/**
 *
 * @author Nitani
 */
public class RegionControllers implements RegionInterface {

    private SessionFactory factory;
    private GeneralDAO gdao = new GeneralDAO(factory);
    private DAOInterface daoid = new GeneralDAO(factory);

    public RegionControllers(SessionFactory factory) {
        this.factory = factory;
        this.gdao = new GeneralDAO(factory);
        this.daoid = new GeneralDAO(factory);
    }

    @Override
    public List<Object> search(String keyword) {
        return this.daoid.doDDL(new Regions(), keyword);
    }

    public RegionControllers() {
    }

    @Override
    public Boolean insert(String regionId, String regionName) {
        boolean hasil = false;
        try {
            Regions reg = new Regions(new BigDecimal(regionId), regionName);
            if (daoid.doDML(reg, false)) {
                hasil = true;
            }
        } catch (Exception e) {

        }
        return hasil;
    }

    @Override
    public Boolean delete(String id) {
        Regions reg = new Regions(new BigDecimal(id));
        return daoid.doDML(reg, true);
    }

    @Override
    public Object getById(Object id) {
        return this.daoid.getById(new Regions(), id);
    }
}
