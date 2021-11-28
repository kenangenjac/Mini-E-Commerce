<%-- 
    Document   : userPanel
    Created on : Nov 25, 2021, 8:11:41 PM
    Author     : kenan
--%>

<%
    List<Item> itemList;
    Object itemListObject = request.getSession().getAttribute("itemList");
    
    if(itemListObject == null){
        itemList = new ArrayList<Item>();                
    }else{
        itemList = (ArrayList<Item>) itemListObject;
    }
%>


<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Beans.Item"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container-fluid d-flex justify-content-center">
    <c:if test="${user.role == 2}">
        <small class="text-muted">USER PANEL</small>
    </c:if>
    <c:if test="${user.role == 3}">
        <small class="text-muted">GUEST PANEL</small>
    </c:if>
</div>

<div class="container-fluid d-flex justify-content-center mt-3 mb-4">
    <c:if test="${user.role == 2}">
        <h1 class="fw-bold">Welcome to User Panel</h1>
    </c:if>
    <c:if test="${user.role == 3}">
        <h1 class="fw-bold">Welcome to Guest Panel</h1>
    </c:if>
</div>

<hr class="m-0">

<div class="container m-3" style="padding-left: 30%">
    <c:if test="${user.role == 2}">
        <a class="btn btn-success p-2" href="GetItems">Press to See Avaliable Items</a>
        <a class="btn btn-success p-2" href="OrderStatus?userId=${user.userId}">Press to See Order Status</a>
    </c:if>
        <c:if test="${user.role == 3}">
        <a class="btn btn-success p-2" href="GetItems" style="margin-left: 15%">Press to See Avaliable Items</a>
    </c:if>
</div>


<table class="table table-striped table-hover">
    <thead>
        <tr>
            <th scope="col" style="padding-left: 30px">ID #</th>
            <th scope="col" style="padding-left: 30px">Item Name</th>
            <th scope="col" style="padding-left: 30px">Item Description</th>
            <th scope="col" style="padding-left: 30px">Item Price</th>
        </tr>
    </thead>

    <tbody>
        <c:forEach items="${itemList}" var="item">
        <tr>
            <th style="padding: 15px 0 0 30px" scope="row">${item.getItemId()}</th>
            <td style="padding: 15px 0 0 30px">${item.getItemName()}</td>
            <td style="padding: 15px 0 0 30px">${item.getItemDescription()}</td>
            <td style="padding: 15px 0 0 30px">${item.getItemPrice()}</td>
            <c:if test="${user.role == 2}">
                <td><a href="addToCart?id=${item.getItemId()}&name=${item.getItemName()}&desc=${item.getItemDescription()}&price=${item.getItemPrice()}" class="btn btn-success">Add to Cart</a></td>
            </c:if>
            <c:if test="${user.role == 3}">
                <td><button class="btn disabled">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button></td>
            </c:if>
        </tr>
        </c:forEach>
    </tbody>
    
</table>
