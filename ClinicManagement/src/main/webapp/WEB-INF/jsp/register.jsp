<%-- 
    Document   : register
    Created on : 19 Aug 2022, 15:39:21
    Author     : nhatp
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h1 class="text-center text-danger">DANG KY</h1>

<c:if test="${errMsg != null}">
    <div class="alert alert-danger">
        ${errMsg}
    </div>
</c:if>

<c:url value="/register" var="action" />

<form:form method="post" action="${action}" 
           enctype="multipart/form-data" modelAttribute="user">
        
    <div class="form-group">
        <form:errors path="firstName" class="text-danger" element="div" />
        <label for="firstname">First Name</label>
        <form:input type="text" id="firstname" path="firstName" class="form-control" />
    </div>
    <div class="form-group">
        <form:errors path="lastName" class="text-danger" element="div" />
        <label for="lastname">Last Name</label>
        <form:input type="text" id="lastname" path="lastName" class="form-control" />
    </div>
    <div class="form-group">
        <label for="email">Email</label>
        <form:input type="email" id="email" path="email" class="form-control" />
    </div>
    <div class="form-group">
        <form:errors path="phone" class="text-danger" element="div" />
        <label for="phone">Phone</label>
        <form:input type="number" id="phone" path="phone" class="form-control" />
    </div>
    <div class="form-group">
        <form:errors path="username" class="text-danger" element="div" />
        <label for="username">Username</label>
        <form:input type="text" id="username" path="username" class="form-control" />
    </div>
    <div class="form-group">
        <form:errors path="password" class="text-danger" element="div" />
        <label for="password">Password</label>
        <form:input type="password" id="password" path="password" class="form-control" />
    </div>
    <div class="form-group">
        <label for="confirm-password">Confirm Password</label>
        <form:input type="password" id="confirm-password" path="confirmPassword" class="form-control" />
    </div>
    <div class="form-group">
        <label for="avatar">Anh</label>
        <form:input type="file" class="form-control" id="avatar" path="file" />
    </div>
    <div class="form-group">
        <input type="submit" value="DANG KY" class="btn btn-danger" />
    </div>
</form:form>
