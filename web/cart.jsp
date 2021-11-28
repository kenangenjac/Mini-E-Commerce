<%-- 
    Document   : cart
    Created on : Nov 26, 2021, 12:27:51 AM
    Author     : kenan
--%>

<%@page import="Beans.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Beans.Item"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    List<Cart> cartItems;
    Object cartItemsObject = request.getSession().getAttribute("cartList");
    
    if(cartItemsObject == null){
        cartItems = new ArrayList<Cart>();                
    }else{
        cartItems = (ArrayList<Cart>) cartItemsObject;
    }
    double totalPrice = 0;
    String items = "";
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
            <small class="text-muted fw-bold">USER PANEL - CART</small>
        </div>
        
        <hr>
        
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th scope="col" style="padding-left: 30px">#</th>
                    <th scope="col" style="padding-left: 30px">Item Name</th>
                    <th scope="col" style="padding-left: 30px">Item Description</th>
                    <th scope="col" style="padding-left: 30px">Item Price</th>
                </tr>
            </thead>

            <tbody>
                <%for(int i = 0; i < cartItems.size(); i++){%>
                <tr>
                    <th style="padding: 15px 0 0 30px" scope="row"><%=cartItems.get(i).getItemId()%></th>
                    <td style="padding: 15px 0 0 30px"><%=cartItems.get(i).getItemName()%></td>
                    <td style="padding: 15px 0 0 30px"><%=cartItems.get(i).getItemDescription()%></td>
                    <td style="padding: 15px 0 0 30px"><%=cartItems.get(i).getItemPrice()%></td>
                    <td><a href="removeFromCart?id=<%=cartItems.get(i).getItemId()%>" class="btn btn-success">Remove Item</a></td>
                </tr>
                <%
                    totalPrice += cartItems.get(i).getItemPrice();
                    if( i < cartItems.size()-1){
                        items += cartItems.get(i).getItemName() + ", ";
                    }else{
                        items += cartItems.get(i).getItemName();
                    }
                }
                %>
            </tbody>
        </table>
            <div class="container d-flex align-items-center justify-content-center mt-5">
                <a class="btn btn-success btn-lg" href="PlaceOrder?totalPrice=<%=totalPrice%>&items=<%=items%>&userId=${user.userId}">Place Order</a>
            </div>
    </body>
</html>
