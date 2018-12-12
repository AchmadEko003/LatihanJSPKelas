/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import interfaces.LocationControllerInterface;
import daos.GeneralDAO;
import daos.DAOInterface;
import entities.Countries;
import entities.Locations;
import java.util.List;
import org.hibernate.SessionFactory;

/**
 *
 * @author Kaukanoer
 */
public class LocationController implements LocationControllerInterface {

    private Locations location;
    private Countries country;
    private DAOInterface gdao;

    public LocationController(SessionFactory factory) {
        this.gdao = new GeneralDAO(factory);
    }

    @Override
    public boolean save(String locationid, String streetAddress, String postalCode, String city, String stateProvince, String countryId) {
        short locationId = Short.valueOf(locationid);
        country = new Countries(countryId);
        location = new Locations(locationId, streetAddress, postalCode, city, stateProvince, country);
        return gdao.doDML(location, false);
    }

    @Override
    public boolean delete(String locationid, String city) {
        short locationId = Short.valueOf(locationid);
        location = new Locations(locationId, city);
        return gdao.doDML(location, true);
    }

    @Override
    public Object getById(String locationId) {
        location = new Locations(new Short(locationId));
        return this.gdao.getById(location, locationId);
    }

    @Override
    public List<Object> getAll() {
        return this.gdao.doDDL(new Locations(), "");
    }
}
