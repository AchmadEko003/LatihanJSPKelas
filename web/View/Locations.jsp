<%-- 
    Document   : Locations
    Created on : Dec 11, 2018, 3:55:04 PM
    Author     : Mukhlish
--%>

<%@page import="entities.Regions"%>
<%@page import="daos.GeneralDAO"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="daos.DAOInterface" %>
<%@page import="entities.Locations" %>
<%@page import="entities.Countries" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <title>Locations</title>

        <script type="text/javascript">
            $(document).ready(function () {
                $('[id="details"]').click(function () {
                    var id = $(this).attr('value');
                    $.get("../data?id=" + id, function (HASIL, status) {
                        $("#detail").html(HASIL);
                        $('#myModal').modal('show');
                    });
                });
            });
        </script>
    </head>
    <body>
        <%
            String locationId = "";
            String streetAddress = "";
            String postalCode = "";
            String city = "";
            String stateProvince = "";
            String countryId = "";
            if (session.getAttribute("isiLocation") != null) {
                Locations l = (Locations) session.getAttribute("isiLocation");
                locationId = l.getLocationId().toString();
                streetAddress = l.getStreetAddress();
                postalCode = l.getPostalCode();
                city = l.getCity();
                stateProvince = l.getStateProvince();
                countryId = l.getCountryId().getCountryId();
            }
        %>

        <div class="col-sm-5 container">




            <!-- Modal -->
            <div id="myModal" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <!-- konten modal-->
                    <div class="modal-content">
                        <!-- heading modal -->
                        <div class="modal-header">
    
                            <h4 class="modal-title">Details</h4>
                        </div>
                        <!-- body modal -->
                        <div class="modal-body">
                            <form method="POST" action="../addLocation">
                                <div class="form-group form-inline">
                                    <label class="control-label col-sm-5">LocationsId: </label>
                                    <div class="col-sm-6">          

                                        <input id="" type="text" class="form-control"  name="LocationId" value="<%= locationId%>">
                                    </div>
                                </div>
                                <div class="form-group form-inline">
                                    <label class="control-label col-sm-5">CountryId : </label>
                                    <div class="col-sm-6">          

                                        <input id="" type="text" class="form-control"  name="CountryId" value="<%= countryId%>">
                                    </div>
                                </div>
                                <div class="form-group form-inline">
                                    <label class="control-label col-sm-5">Street address: </label>
                                    <div class="col-sm-6">          

                                        <input id="" type="text" class="form-control"  name="StreetAddres" value="<%= streetAddress%>">
                                    </div>
                                </div>
                                <div class="form-group form-inline">
                                    <label class="control-label col-sm-5">Local post: </label>
                                    <div class="col-sm-6">          

                                        <input id="" type="text" class="form-control"  name="PostalCode" value="<%= postalCode%>">
                                    </div>
                                </div>
                                <div class="form-group form-inline">
                                    <label class="control-label col-sm-5">City: </label>
                                    <div class="col-sm-6">          

                                        <input id="" type="text" class="form-control"  name="City" value="<%= city%>">
                                    </div>
                                </div>
                                <div class="form-group form-inline">
                                    <label class="control-label col-sm-5">State province: </label>
                                    <div class="col-sm-6">          

                                        <input id="" type="text" class="form-control"  name="StateProvince" value="<%= stateProvince%>">
                                    </div>
                                </div>
                                <% session.removeAttribute("isiLocation");%>
                                <div class="form-group form-inline">
                                    <label class="control-label col-sm-5"></label>
                                    <div class="col-md-2">
                                        <button type="submit" class="btn btn-default" id="ASD" name="">Save</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- footer modal -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

            <h1>Locations</h1><br>


            <form method="POST" action="../addLocation">
                <div class="form-group form-inline">
                    <label class="control-label col-sm-5">LocationsId: </label>
                    <div class="col-sm-6">          

                        <input id="" type="text" class="form-control"  name="locationId" value="<%= locationId%>">
                    </div>
                </div>
                <div class="form-group form-inline">
                    <label class="control-label col-sm-5">CountryId : </label>
                    <div class="col-sm-6">          

                        <input id="" type="text" class="form-control"  name="countryId" value="<%= countryId%>">
                    </div>
                </div>
                <div class="form-group form-inline">
                    <label class="control-label col-sm-5">Street address: </label>
                    <div class="col-sm-6">          

                        <input id="" type="text" class="form-control"  name="streetAddress" value="<%= streetAddress%>">
                    </div>
                </div>
                <div class="form-group form-inline">
                    <label class="control-label col-sm-5">Local post: </label>
                    <div class="col-sm-6">          

                        <input id="" type="text" class="form-control"  name="postalCode" value="<%= postalCode%>">
                    </div>
                </div>
                <div class="form-group form-inline">
                    <label class="control-label col-sm-5">City: </label>
                    <div class="col-sm-6">          

                        <input id="" type="text" class="form-control"  name="city" value="<%= city%>">
                    </div>
                </div>
                <div class="form-group form-inline">
                    <label class="control-label col-sm-5">State province: </label>
                    <div class="col-sm-6">          

                        <input id="" type="text" class="form-control"  name="stateProvince" value="<%= stateProvince%>">
                    </div>
                </div>
                <% session.removeAttribute("isiLocation"); %>
                <div class="form-group form-inline">
                    <label class="control-label col-sm-5"></label>
                    <div class="col-md-2">
                        <button type="submit" class="btn btn-default" id="ASD" name="">Save</button>
                    </div>
                </div>
            </form>

            <table  class="table table-bordered table100">
                <thead>
                    <tr>
                        <th> LocationsId </th>
                        <th> CountryId </th>
                        <th> Street address </th>
                        <th> Local post </th>
                        <th> City </th>
                        <th> State province </th>
                    </tr>
                </thead>
                <tbody>


                    <%SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
                        DAOInterface daoi = new GeneralDAO(sessionFactory);
                        for (Object object : daoi.doDDL(new Locations(), "")) {
                            Locations l = (Locations) object;
                            //                System.out.println(e.getLastName());
                    %>
                    <tr>
                        <td><%= l.getLocationId()%></td>
                        <td><%= l.getCountryId().getCountryId()%></td>
                        <td><%= l.getStreetAddress()%></td>
                        <td><%= l.getPostalCode()%></td>
                        <td><%= l.getCity()%></td>
                        <td><%= l.getStateProvince()%></td>
                        <td><a class="btn btn-info" id="details" data-toggle="modal" data-target="#myModal" value="<%= l.getLocationId()%>" >Detail</a></td>
                        <td><a href="../deleteLocation?id=<%= l.getLocationId()%>" class="btn btn-warning" onclick="return confirm('Are you sure to delete this data?');">Delete</a></td>
                        <td><a href="../editLocation?id=<%= l.getLocationId()%>" class="btn btn-success">Edit</a></td>
                    </tr>

                    <% }
                    %>

                </tbody>
            </table>
        </div>


    </body>
</html>
