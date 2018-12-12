<%-- 
    Document   : view
    Created on : Dec 11, 2018, 10:21:07 PM
    Author     : Igaz
--%>

<%@page import="interfaces.JobInterface"%>
<%@page import="entities.Jobs"%>
<%@page import="controllers.JobController"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  String idEdit="", titleEdit="", minEdit="", maxEdit="";
        if (session.getAttribute("isiJob")!=null) {
                Jobs j = (Jobs)session.getAttribute("isiJob");
                idEdit = j.getJobId().toString();
                titleEdit = j.getJobTitle();
                minEdit = j.getMinSalary().toString();
                maxEdit = j.getMaxSalary().toString();
                System.out.println(j);
        }
        %>
        <div style="margin-top: 50px">
            <h1 align="center">Form Job</h1>
            <form action="../addJob">
            <table border="0" align="center">
                <tbody
                    <tr>
                        <td>Job id</td>
                        <td>:</td>
                        <td><input type="text" name="jobId" value="<%= idEdit%>" /></td>
                    </tr>
                    <tr>
                        <td>Job Title</td>
                        <td>:</td>
                        <td><input type="text" name="jobTitle" value="<%= titleEdit%>" /></td>
                    </tr>
                    <tr>
                        <td>Min Salary</td>
                        <td>:</td>
                        <td><input type="text" name="minSalary" value="<%= minEdit%>" /></td>
                    </tr>
                    <tr>
                        <td>Max Salary</td>
                        <td>:</td>
                        <td><input type="text" name="maxSalary" value="<%= maxEdit%>" /></td>
                    </tr>
                    <% session.removeAttribute("isiJob"); %>
                    <tr>
                        <td colspan="3" align="center" width="100">
                            <input type="submit" value="Simpan" name="simpan" />
                        </td>
                    </tr>
                </tbody>
            </table>

        </form>
        </div>
        
        <h1 align="center">Table Job</h1>
        <table border="1" align="center">
            <thead>
                <tr>
                    <th width="150">Job_id</th>
                    <th width="150">Job_title</th>
                    <th width="150">Min_salary</th>
                    <th width="150">Max_salary</th>
                    <th colspan="2">Aksi</th>
                </tr>
            </thead>
            <tbody>
                <% SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
                    JobInterface ji = new JobController(sessionFactory);
                    for (Object object : ji.getAllData()) {
                            Jobs j = (Jobs)object;
                %>
                <tr>
                    <td><%= j.getJobId() %></td>
                    <td><%= j.getJobTitle() %></td>
                    <td><%= j.getMinSalary() %></td>
                    <td><%= j.getMaxSalary() %></td>
                    <td><a href="../UpdateJob?id=<%= j.getJobId()%>"><input type="submit" value="Edit" name="edit" /></a></td>
                    <td><a href="../DeleteJob?id=<%= j.getJobId()%>"></a><input type="submit" value="Delete" name="Delete" /></td>
                
                <% 
                    }
                %>
                </tr>
            </tbody>
        </table>

    </body>
</html>
