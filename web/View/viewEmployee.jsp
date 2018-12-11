<%-- 
    Document   : viewEmployee
    Created on : Dec 11, 2018, 2:02:35 PM
    Author     : Nitani
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="controllers.EmployeeControllers"%>
<%@page import="interfaces.EmployeeInterface"%>
<%@page import="entities.Employees"%>
<%@page import="controllers.RegionControllers"%>
<%@page import="interfaces.RegionInterface"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <% String idEdit = "", nameFirst = "", nameLast = ""
                    , emails = "", phoneNum = "", dateHire = ""
                    , jobs = "", sal = "", commissions = ""
                    , manage = "", dept = "";
                if (session.getAttribute("ids") != null) {
                    Employees r = (Employees) session.getAttribute("ids");
                    idEdit = r.getEmployeeId().toString();
                    nameFirst = r.getFirstName();
                    nameLast = r.getLastName();
                    emails = r.getEmail();
                    phoneNum = r.getPhoneNumber();
                    dateHire = r.getHireDate().toString();
                    jobs = r.getJobId().getJobTitle();
                    sal = r.getSalary().toString();
                    commissions = r.getCommissionPct().toString();
                    manage = r.getManagerId().getFirstName();
                    dept = r.getDepartmentId().getDepartmentName();
                }
            %>
            <form class="form-group" action="../servlet">
                <div class="form-group">
                    <label for="id">ID:</label>
                    <input type="text" class="form-control" id="id">
                </div>
                <div class="form-group">
                    <label for="firstName">First Name</label>
                    <input type="text" class="form-control" id="firstName">
                </div>
                <div class="form-group">
                    <label for="lastName">Last Name:</label>
                    <input type="text" class="form-control" id="lastName">
                </div>
                <div class="form-group">
                    <label for="email">Email address:</label>
                    <input type="email" class="form-control" id="email">
                </div>
                <div class="form-group">
                    <label for="phone">Phone Number:</label>
                    <input type="text" class="form-control" id="phone">
                </div>
                <div class="form-group">
                    <label for="date">Date:</label>
                    <input type="date" class="form-control" id="date">
                </div>
                <div class="form-group">
                    <label for="job">Job:</label>
                    <input type="text" class="form-control" id="job">
                </div>
                <div class="form-group">
                    <label for="salary">Salary:</label>
                    <input type="text" class="form-control" id="salary">
                </div>
                <div class="form-group">
                    <label for="commission">Commission Pct:</label>
                    <input type="text" class="form-control" id="commission">
                </div>
                <div class="form-group">
                    <label for="manager">Manager:</label>
                    <input type="text" class="form-control" id="manager">
                </div>
                <div class="form-group">
                    <label for="department">Department:</label>
                    <input type="text" class="form-control" id="department">
                </div>
            </form>
        </div>
            <br>
            <div class="">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Phone Number</th>
                        <th>Hire Date</th>
                        <th>Job</th>
                        <th>Salary</th>
                        <th>Commission Pct</th>
                        <th>Manager</th>
                        <th>Department</th>
                        <th>DML</th>
                    </tr>
                </thead>
                <% SessionFactory factory = HibernateUtil.getSessionFactory();
                    EmployeeInterface employeeInterface = new EmployeeControllers(factory);
                    DateFormat formats = new SimpleDateFormat("d MMMM yyyy", Locale.ENGLISH);
                    for (Object emp : employeeInterface.search("")) {
                        Employees employees = (Employees) emp;
                Date hire = employees.getHireDate();%>
                <tbody>
                    <tr>
                        <td><%= employees.getEmployeeId()%></td>
                        <td><%= employees.getFirstName()%></td>
                        <td><%= employees.getLastName()%></td>
                        <td><%= employees.getEmail()%></td>
                        <td><%= employees.getPhoneNumber()%></td>
                        <td><%= formats.format(hire) %></td>
                        <td><%= employees.getJobId().getJobTitle()%></td>
                        <td><%= employees.getSalary()%></td>

                        <% if (employees.getCommissionPct() == null) { %><td>0</td>
                        <% } else {%> <td><%= employees.getCommissionPct()%></td>
                        <% }%>

                        <td><%= employees.getManagerId().getFirstName()%></td>

                        <% if (employees.getDepartmentId() == null) {
                        %><td>-</td><% } else {
                        %><td><%= employees.getDepartmentId().getDepartmentName()%></td><% }
                        %>

                        <td><a href="../editServlet?id=<%= employees.getEmployeeId()%>">Edit</a></td>
                        <td><a href="../deleteEmployee?id=<%= employees.getEmployeeId()%>">Delete</a></td>
                    </tr>
                    <%}
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>
