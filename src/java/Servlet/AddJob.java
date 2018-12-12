/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import controllers.JobController;
import daos.DAOInterface;
import daos.GeneralDAO;
import entities.Jobs;
import interfaces.JobInterface;
import interfaces.RegionInterface;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import javax.print.attribute.standard.MediaSizeName;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.SessionFactory;
import tools.HibernateUtil;

/**
 *
 * @author Igaz
 */
@WebServlet(name = "AddJob", urlPatterns = {"/addJob"})
public class AddJob extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String jobId = request.getParameter("jobId");
            String jobTitle = request.getParameter("jobTitle");
            String minSalary = request.getParameter("minSalary");
            String maxSalary = request.getParameter("maxSalary");

            /* TODO output your page here. You may use following sample code. */
            SessionFactory factory = HibernateUtil.getSessionFactory();
            DAOInterface daoi = new GeneralDAO(factory);
            JobInterface ji = new JobController(factory);
            ji.insertOrUpdate(jobId, jobTitle, minSalary, maxSalary);
            response.sendRedirect("View/viewJob.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
