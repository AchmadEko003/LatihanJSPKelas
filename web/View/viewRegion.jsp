<%-- 
    Document   : index
    Created on : Dec 11, 2018, 8:42:19 AM
    Author     : Nitani
--%>

<%@page import="entities.Regions"%>
<%@page import="controllers.RegionControllers"%>
<%@page import="interfaces.RegionInterface"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table, th, td {
                border: 1px solid black;
            }
        </style>
    </head>
    <body>
        <h1>Hello World!</h1>
        <% String idEdit = "", nameEdit = "";
        if(session.getAttribute("idsa")!= null){
            Regions r = (Regions) session.getAttribute("ids");
            idEdit = r.getRegionId().toString();
            nameEdit = r.getRegionName();
            out.print(idEdit);
            out.print(nameEdit);
        }
        %>
        <form action="../servlet">
            <table>
                <tr>
                    <td>ID : </td>
                    <td><input type="text" name="id" value="<%= idEdit %>" /></td>
                </tr>
                <tr>
                    <td>Name : </td>
                    <td><input type="text" name="name" value="<%= nameEdit %>" /></td>
                </tr>
                <% session.removeAttribute("ids"); %>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Input" /></td>
                </tr>
            </table>
        </form>
        <table>
            <tr>
                <th>ID</th>
                <th>Region</th>
            </tr>
            <% SessionFactory factory = HibernateUtil.getSessionFactory();
                RegionInterface regionInterface = new RegionControllers(factory);
                for (Object region : regionInterface.search("")) {
                Regions regions = (Regions) region;%>
            <tr>
                <td><%= regions.getRegionId()%></td>
                <td><%= regions.getRegionName()%></td>
                <td><a href="../editServlet?id=<%= regions.getRegionId()%>">Edit</a></td>
                <td><a href="../deleteRegion?id=<%= regions.getRegionId()%>">Delete</a></td>
            </tr>
            <%}
            %>
        </table>
    </body>
</html>
