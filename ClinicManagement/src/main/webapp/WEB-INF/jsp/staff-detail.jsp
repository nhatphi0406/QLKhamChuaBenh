<%-- 
    Document   : staff-detail
    Created on : 31 Aug 2022, 12:55:19
    Author     : nhatp
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<h1 class="text-center text-danger">CHI TIET NHAN VIEN</h1>
<div class="row">
    <div class="col-md-6">
        <c:choose>
            <c:when test="${staff.avatar != null && staff.avatar.startsWith('https') == true}">
                <img class="card-img-top img-fluid" src="${staff.avatar}" alt="${staff.firstName} ${staff.lastName}" />
            </c:when>

            <c:when test="${staff.avatar == null || staff.avatar.startsWith('https') == false}">
                <img class="card-img-top img-fluid" src="<c:url value="/images/null-avata.png" />" alt="${staff.firstName} ${staff.lastName}" />
            </c:when>
        </c:choose>
    </div>
    <div class="col-md-6">
        <h1>${staff.firstName} ${staff.lastName}</h1>
        <h3>Email: ${staff.email}</h3>
        <h3>So dien thoai: ${staff.phone}</h3>
        <c:choose>
            <c:when test="${staff.userRole == 'ROLE_ADMIN'}"><h3>Chuc vu: Admin</h3></c:when>
            <c:when test="${staff.userRole == 'ROLE_DOCTOR'}"><h3>Chuc vu: Bac si</h3></c:when>
            <c:when test="${staff.userRole == 'ROLE_NURSE'}"><h3>Chuc vu: Y ta</h3></c:when>
        </c:choose>
    </div>
</div>
