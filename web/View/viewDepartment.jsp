<%-- 
    Document   : view
    Created on : Dec 11, 2018, 7:51:35 PM
    Author     : Genius
--%>

<%@page import="entities1.Location"%>
<%@page import="entities1.Employee"%>
<%@page import="controllers.DepartmentController"%>
<%@page import="entities1.Department"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Web Application - Department</title>
        <link rel="shortcut icon" type="image/x-icon" href="#">
	<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<!-- Bootstrap 3.3.7 -->
	<link rel="stylesheet" href="../asset/bootstrap/css/bootstrap.min.css">
    </head>
    <body>
        <% 
            String getDepartmetId = "", getDepartmentName = "", getManager = "", getLocation = "";
            if (session.getAttribute("department") != null) {
                Department dep = (Department) session.getAttribute("department");
                getDepartmetId = dep.getDepartmentId().toString();
                getDepartmentName = dep.getDepartmentName().toString();
                if (dep.getManagerId() != null) {
                    getManager = dep.getManagerId().getLastName();
                } else {
                    getManager = "0";
                }
                if (dep.getLocationId() != null) {
                    getLocation = dep.getLocationId().getCity();
                } else {
                    getLocation = "0";
                }
            }
            
            SessionFactory factory = HibernateUtil.getSessionFactory();
            DepartmentController dc = new DepartmentController(factory);
        %>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel basic-default">
                        <div class="panel-heading">
                            <h3>Form Department</h3>
                        </div>
                        <div class="panel-body">
                            <form method="POST" action="../addDepartment">
                                <div class="form-group">
                                    <label>ID</label>
                                    <input type="text" class="form-control" name="id" value="<%= getDepartmetId %>">
                                </div>
                                <div class="form-group">
                                    <label>Nama</label>
                                    <input type="text" class="form-control" name="nama" value="<%= getDepartmentName %>">
                                </div>
                                <div class="form-group">
                                    <label>Manager</label>
                                    <select class="form-control" name="manager">
                                        <option value="">Pilih Manager</option>
                                        <%
                                        for (Object o : dc.getAll(new Employee(), "")) {
                                            Employee employee = (Employee) o;
                                            if (employee.getLastName().equals(getManager)) {
                                                %>
                                                <option selected value="<%= employee.getEmployeeId() %>"><%= employee.getLastName() %></option>    
                                                <%
                                            } else {
                                                %>
                                                <option value="<%= employee.getEmployeeId() %>"><%= employee.getLastName() %></option>    
                                                <%
                                            }
                                        }    
                                        %>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Location</label>
                                    <select class="form-control" name="location">
                                        <option value="">Pilih Location</option>
                                        <%
                                        for (Object o : dc.getAll(new Location(), "")) {
                                            Location location = (Location) o;
                                            if (location.getCity().equals(getLocation)) {
                                                %>
                                                <option selected value="<%= location.getLocationId() %>"><%= location.getCity() %></option>    
                                                <%
                                            } else {
                                                %>
                                                <option value="<%= location.getLocationId() %>"><%= location.getCity() %></option>    
                                                <%
                                            }
                                            %>
                                            <option value="<%= location.getLocationId() %>"><%= location.getCity() %></option>    
                                            <%
                                        }    
                                        %>
                                    </select>
                                </div>
                                <button clas type="submit" class="btn btn-info">Submit</button>
                                <% session.removeAttribute("department"); %>
                            </form>
                        </div>
                    </div>
                    <div class="panel basic-default">
                        <div class="panel-heading">
                            <h3>Table Department</h3>
                        </div>
                        <div class="panel-body">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>ID</th>
                                        <th>Nama</th>
                                        <th>Manager</th>
                                        <th>Location</th>
                                        <th width="200">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                    int no = 1;
                                    for (Object o : dc.getAll(new Department(), "")) { 
                                        Department d = (Department) o;
                                    %>
                                        <tbody>
                                            <tr>
                                                <td><%= no %></td>
                                                <td><%= d.getDepartmentId() %></td>
                                                <td><%= d.getDepartmentName() %></td>
                                                <td>
                                                    <%
                                                        if (d.getManagerId() != null) {
                                                            %>
                                                            <%= d.getManagerId().getLastName() %>
                                                            <%
                                                        } else {
                                                            %>
                                                            -
                                                            <%
                                                        }
                                                    %>
                                                </td>
                                                <td>
                                                    <%
                                                        if (d.getLocationId()!= null) {
                                                            %>
                                                            <%= d.getLocationId().getCity()%>
                                                            <%
                                                        } else {
                                                            %>
                                                            -
                                                            <%
                                                        }
                                                    %>
                                                </td>
                                                <td>
                                                    <a href="../updateDepartment?id=<%= d.getDepartmentId() %>">
                                                        <input class="btn btn-warning btn-md" type="button" value="Update" />
                                                    </a>
                                                    <a href="../deleteDepartment?id=<%= d.getDepartmentId() %>">
                                                        <input class="btn btn-info btn-md" type="button" value="Delete" />
                                                    </a>
                                                </td>
                                            </tr>
                                        </tbody>
                                    <%
                                    no++;
                                    }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Bootstrap 3.3.7 -->
	<script src="../asset/bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>
