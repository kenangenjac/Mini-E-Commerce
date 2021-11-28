<%--            
    Document   : home
    Created on : Nov 24, 2021, 1:35:21 AM
    Author     : kenan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" rel="stylesheet">
    </head>
    <body style="font-family: 'Montserrat', sans-serif; width: 100%; height: 100%">
        
        <jsp:include page="navbar.jsp"></jsp:include>
        
        <c:if test="${user.role == 1}">
            <jsp:include page="adminPanel.jsp"></jsp:include>
        </c:if>
        <c:if test="${user.role == 2}">
            <jsp:include page="userPanel.jsp"></jsp:include>
        </c:if>
        <c:if test="${user.role == 3}">
            <jsp:include page="userPanel.jsp"></jsp:include>
        </c:if>
    </body>
</html>
