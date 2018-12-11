/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import controllers.EmployeeControllers;
import controllers.RegionControllers;
import entities.Employees;
import entities.Regions;
import interfaces.EmployeeInterface;
import interfaces.RegionInterface;
import org.hibernate.SessionFactory;

/**
 *
 * @author Nitani
 */
public class NewClass {

    public static void main(String[] args) {
        SessionFactory factory = HibernateUtil.getSessionFactory();
        System.out.println(factory);
            RegionInterface emp = new RegionControllers(factory);
            System.out.println(emp.delete("99"));
//            for (Object emp2 : emp.search("")) {
//                Regions en = (Regions) emp2;
//                System.out.println(en.getRegionName());
//    }
    }
}
