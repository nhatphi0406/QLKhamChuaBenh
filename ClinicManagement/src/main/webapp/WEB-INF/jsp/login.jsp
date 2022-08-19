<%-- 
    Document   : login
    Created on : 19 Aug 2022, 15:39:02
    Author     : nhatp
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<h1>Login</h1>

<c:if test="${param.error != null}">
    <div class="alert alert-danger">
        Da co loi xay ra! Vui long quay lai sau!
    </div>
</c:if>

<c:if test="${param.accessDenied != null}">
    <div class="alert alert-danger">
        Da co loi xay ra! Vui long quay lai sau!!!
    </div>
</c:if>


<c:url value="/login" var="action" />

<form method="post" action="${action}">
    <div class="form-group">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" class="form-control" />
    </div>
    <div class="form-group">
        <label for="username">Password</label>
        <input type="text" id="password" name="password" class="form-control" />
    </div>
    <br/>
    <div class="form-group">
        <input type="submit" value="DANG NHAP" class="btn btn-danger"/>
    </div>
</form>
