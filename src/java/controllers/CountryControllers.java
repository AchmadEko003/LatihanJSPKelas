/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAOInterface;
import daos.GeneralDAO;
import entities.Countries;
import entities.Regions;
import interfaces.CountryInterface;
import java.math.BigDecimal;
import java.util.List;
import org.hibernate.SessionFactory;



/**
 *
 * @author Nitani
 */
public class CountryControllers implements CountryInterface{

        private SessionFactory factory;
        DAOInterface daoi = new GeneralDAO(factory);

    public CountryControllers() {
    }

    public CountryControllers(SessionFactory factory) {
        this.factory = factory;
         this.daoi = new GeneralDAO(factory);
    }

    @Override
    public List<Object> search(String keyword) {
       return this.daoi.doDDL(new Countries(), keyword);
    }

    @Override
    public Object getById(Object id) {
      return this.daoi.getById(new Countries(), id);
    }

    @Override
   public boolean insert(String countryId, String countryName, String regId) {
        boolean hasil = false;
        try {
            Regions region = new Regions(new BigDecimal(regId));
            Countries country = new Countries(countryId, countryName, region);
            if (daoi.doDML(country, false)) {
                hasil = true;
            }
        } catch (Exception e) {
        }
        return hasil;
    }

    @Override
    public String update(String id, String name, String regionId) {
        return null;
    }

    @Override
     public boolean delete(String countryId) {
        boolean hasil = false;
        try {
            Countries cou = new Countries(countryId);
            if (daoi.doDML(cou, true)) {
                hasil = true;
            }
        } catch (Exception e) {
        }
        return hasil;
    }

    @Override
    public List<Object> getAll() {
        return daoi.doDDL(new Countries(), "");
    }

    @Override
    public Object getByIdCountry(String id) {
         return this.daoi.getByIdCountry(new Countries(), id);
    }

}
