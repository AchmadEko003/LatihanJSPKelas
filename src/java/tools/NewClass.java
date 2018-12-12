/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import controllers.EmployeeControllers;
import controllers.JobController;
import controllers.RegionControllers;
import entities.Employees;
import entities.Jobs;
import entities.Regions;
import interfaces.EmployeeInterface;
import interfaces.JobInterface;
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
        JobInterface ji = new JobController(factory);
        System.out.println(ji.getById(new Jobs(), "AD_VP"));
//            System.out.println(emp.insert("222", "a", "b", "fsfes", "2301293", "08/08/2009", "IT_PROG", "5000", "0.0", "100", "100"));
////        System.out.println(emp.getById("220"));
//System.out.println(emp.delete("222"));
//            for (Object emp2 : emp.search("")) {
//                Regions en = (Regions) emp2;
//                System.out.println(en.getRegionName());
//    }
    }
}
