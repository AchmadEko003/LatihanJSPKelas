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
        EmployeeInterface emp = new EmployeeControllers(factory);
//            System.out.println(emp.insert("220", "a", "b", "EKO", "2301293", "08/08/2009", "IT_PROG", "5000", "0.0", "100", "100"));
        System.out.println(emp.getById("220"));
//            for (Object emp2 : emp.search("")) {
//                Regions en = (Regions) emp2;
//                System.out.println(en.getRegionName());
//    }
    }
}
