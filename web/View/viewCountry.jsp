<%-- 
    Document   : view1
    Created on : 11 Des 18, 20:40:47
    Author     : NEZIA
--%>

<%@page import="tools.HibernateUtil"%>
<%@page import="controllers.CountryControllers"%>
<%@page import="controllers.RegionControllers"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="entities.Countries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String idEdit = "", nameEdit = "", idrEdit = "";
            if (session.getAttribute("isiCountry") != null) {
                Countries c = (Countries) session.getAttribute("isiCountry");
                idEdit = c.getCountryId();
                nameEdit = c.getCountryName();
                idrEdit = c.getRegionId().getRegionId().toString();
           }%>
        <form action="../addCountry">
            <table border="0"align="center">
                <tbody>
                    <tr>
                        <td>Country Id</td>
                        <td>:</td>
                        <td><input type="text" name="countryId" value="<%= idEdit %>" /></td>
                    </tr>
                    <tr>
                        <td>Country Name</td>
                        <td>:</td>
                        <td><input type="text" name="countryName" value="<%=nameEdit%>" /></td>
                    </tr>
                    <tr>
                        <td>Region Id</td>
                        <td>:</td>
                        <td><input type="text" name="regionId" value="<%=idrEdit%>" /></td>
                    </tr>
                    <% session.removeAttribute("isiCountry"); %>
                    <tr>
                        <td colspan="3" align="center">
                            <input type="submit" value="Simpan" /></td>
                    </tr>                       
                </tbody>   
            </table>
        </form><br>
        <table border="1" align="center">
            <tr>
                <th>Country Id</th>
                <th>Country Name</th>
                <th>Region Id</th>
            </tr>
            <% SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
                CountryControllers cc = new CountryControllers(sessionFactory);
                for (Object country : cc.getAll()) {
                    Countries ct = (Countries) country;
            %>
            <tr>
                <td><%= ct.getCountryId()%></td>
                <td><%= ct.getCountryName()%></td>
                <td><%= ct.getRegionId().getRegionName() %></td>

                <td><a href="../editCountry?id=<%= ct.getCountryId()%>"><input type="submit" value="Edit" /></a></td>
                <td><a href="../deleteCountry?id=<%= ct.getCountryId()%>"><input type="submit" value="Delete" /></a></td>
            </tr>
            <%      }
            %>
        </table>  
        <br> 
    </body>
</html>
