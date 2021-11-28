<%-- 
    Document   : adminCheckOrders.jsp
    Created on : Nov 27, 2021, 10:41:30 PM
    Author     : kenan
--%>

<%@page import="org.w3c.dom.css.Counter"%>
<%@page import="Beans.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Beans.Item"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    List<Order> orderItems;
    Object orderItemsObject = request.getSession().getAttribute("orderList");
    
    if(orderItemsObject == null){
        orderItems = new ArrayList<Order>();                
    }else{
        orderItems = (ArrayList<Order>) orderItemsObject;
    }
%>
   
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" rel="stylesheet">
    </head>
    <body>
        
        <jsp:include page="navbar.jsp"></jsp:include>
        
        <div class="container-fluid d-flex justify-content-center pt-3">
            <small class="text-muted fw-bold">ADMIN PANEL - ORDERS</small>
        </div>
        
        <hr>
        <h4><u>Pending orders</u></h4>
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th scope="col" style="padding-left: 30px;">Order #</th>
                    <th scope="col" style="padding-left: 30px;">Ordered items</th>
                    <th scope="col" style="padding-left: 30px;">Total Price</th>
                    <th scope="col" style="padding-left: 30px;">Order Date</th>
                    <th scope="col" style="padding-left: 30px;">Order Status</th>
                </tr>
            </thead>

            <tbody>
                <%  int counter = 0;
                    for(int i = 0; i < orderItems.size(); i++){
                    if(orderItems.get(i).getOrderStatus() == 0){
                        counter++;
                %>
                <tr>
                    <th style="padding: 15px 0 0 30px" scope="row"><%=i+1%></th>
                    <td style="padding: 15px 0 0 30px"><%=orderItems.get(i).getItems()%></td>
                    <td style="padding: 15px 0 0 30px"><%=orderItems.get(i).getTotalPrice()%></td>
                    <td style="padding: 15px 0 0 30px"><%=orderItems.get(i).getOrderDate()%></td>
                    <td style="padding: 15px 0 0 30px">Order Pending</td>
                    <td><a href="ApproveOrder?id=<%=orderItems.get(i).getOrderId()%>" class="btn btn-success">Approve</a></td>
                    <td><a href="DeclineOrder?id=<%=orderItems.get(i).getOrderId()%>" class="btn btn-success">Decline</a></td>
                    <%}%>
                </tr>
                <%}
                    if(counter == 0){
                %>
                    <tr><td><h6>No Pending Orders</h6></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
                <%}%>
            </tbody>
        </table>
        
        <h4 class="mt-5"><u>Accepted orders</u></h4>
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th scope="col" style="padding-left: 30px">Order #</th>
                    <th scope="col" style="padding-left: 30px">Ordered items</th>
                    <th scope="col" style="padding-left: 30px">Total Price</th>
                    <th scope="col" style="padding-left: 30px">Order Date</th>
                    <th scope="col" style="padding-left: 30px">Order Status</th>
                </tr>
            </thead>

            <tbody>
                <%  counter = 0;
                    for(int i = 0; i < orderItems.size(); i++){
                    if(orderItems.get(i).getOrderStatus() == 1){
                        counter++;
                %>
                <tr>
                    <th style="padding: 15px 0 0 30px" scope="row"><%=i+1%></th>
                    <td style="padding: 15px 0 0 30px"><%=orderItems.get(i).getItems()%></td>
                    <td style="padding: 15px 0 0 30px"><%=orderItems.get(i).getTotalPrice()%></td>
                    <td style="padding: 15px 0 0 30px"><%=orderItems.get(i).getOrderDate()%></td>
                    <td style="padding: 15px 0 0 30px">Order Accepted</td>
                    <td><button class="btn disabled">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button></td>
                    <td><button class="btn disabled">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button></td>
                    <%}%>
                </tr>
                <%}
                    if(counter == 0){
                %>
                    <tr><td><h6>No Accepted Orders</h6></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
                <%}%>
                
            </tbody>
        </table>
        
            <h4 class="mt-5"><u>Declined orders</u></h4>
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th scope="col" style="padding-left: 30px">Order #</th>
                    <th scope="col" style="padding-left: 30px">Ordered items</th>
                    <th scope="col" style="padding-left: 30px">Total Price</th>
                    <th scope="col" style="padding-left: 30px">Order Date</th>
                    <th scope="col" style="padding-left: 30px">Order Status</th>
                </tr>
            </thead>

            <tbody>
                <%  counter = 0;
                    for(int i = 0; i < orderItems.size(); i++){
                    if(orderItems.get(i).getOrderStatus() == 2){
                        counter++;    
                %>
                <tr>
                    <th style="padding: 15px 0 0 30px" scope="row"><%=i+1%></th>
                    <td style="padding: 15px 0 0 30px"><%=orderItems.get(i).getItems()%></td>
                    <td style="padding: 15px 0 0 30px"><%=orderItems.get(i).getTotalPrice()%></td>
                    <td style="padding: 15px 0 0 30px"><%=orderItems.get(i).getOrderDate()%></td>
                    <td style="padding: 15px 0 0 30px">Order Declined</td>
                    <td><button class="btn disabled">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button></td>
                    <td><button class="btn disabled">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button></td>
                    <%}%>
                </tr>
                <%}
                if(counter == 0){
                %>
                    <tr><td><h6>No Declined Orders</h6></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
                <%}%>
            </tbody>
        </table>
    </body>
</html>
