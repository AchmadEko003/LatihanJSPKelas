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
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <% String idEdit = "", nameFirst = "", nameLast = "", emails = "", phoneNum = "", dateHire = "", jobs = "", sal = "", commissions = "", manage = "", dept = "";
                if (session.getAttribute("ida") != null) {
                    Employees r = (Employees) session.getAttribute("ida");
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

            <form class="form-group" action="../insertEmployee">
                <div class="form-group">
                    <label for="id">ID:</label>
                    <input type="text" class="form-control" name="id" value="<%= idEdit%>">
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="firstName">First Name</label>
                        <input type="text" class="form-control" id="firstName" value="<%= nameFirst%>">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="lastName">Last Name</label>
                        <input type="text" class="form-control" id="lastName" value="<%= nameLast%>">
                    </div>
                </div>
                <div class="form-group">
                    <label for="email">Email address:</label>
                    <input type="email" class="form-control" name="email" value="<%= emails%>">
                </div>
                <div class="form-group">
                    <label for="phone">Phone Number:</label>
                    <input type="text" class="form-control" name="phone" value="<%= phoneNum%>">
                </div>
                <div class="form-group">
                    <label for="date">Date:</label>
                    <input type="date" class="form-control" name="date" value="<%= dateHire%>">
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="job">Job:</label>
                        <input type="text" class="form-control" name="job" value="<%= jobs%>">
                    </div>
                    <div class="form-group col-md-4">
                        <label for="salary">Salary:</label>
                        <input type="text" class="form-control" name="salary" value="<%= sal%>">
                    </div>
                    <div class="form-group col-md-2">
                        <label for="commission">Commission Pct:</label>
                        <input type="text" class="form-control" name="commission" value="<%= commissions%>">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="manager">Manager:</label>
                        <input type="text" class="form-control" name="manager" value="<%= manage%>">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="department">Department:</label>
                        <input type="text" class="form-control" name="department" value="<%= dept%>">
                    </div>
                </div>

                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#tambah">Tambah</button>

                <div class="modal fade" id="tambah" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Tambah Karyawan</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <p>Apa anda yakin ingin menambahkan data karyawan?</p>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-default">Submit</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <br><br>
                <input class="form-control" id="myInput" type="text" placeholder="Search..">
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
                        <td><%= formats.format(hire)%></td>
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

                        <td>
                            <div class="btn-group" role="group" aria-label="Basic example">
                                <a class="btn btn-info" href="../editEmployee?id=<%= employees.getEmployeeId()%>" role="button">Edit</a>
                                <a class="btn btn-info" href="../deleteEmployee?id=<%= employees.getEmployeeId()%>" role="button">Delete</a>
                            </div>
                        </td>
                    </tr>
                    <% }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>
