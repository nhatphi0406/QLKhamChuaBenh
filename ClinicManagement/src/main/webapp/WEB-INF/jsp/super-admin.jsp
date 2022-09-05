<%-- 
    Document   : super-admin
    Created on : 1 Sep 2022, 09:33:58
    Author     : nhatp
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-md bg-dark navbar-dark">
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <form class="form-inline" action="<c:url value="/sysadmin" />">
            <input class="form-control mr-sm-2" name="kw" type="text" placeholder="Nhap tu khoa...">
            <button class="btn btn-success" type="submit">Tim</button>
        </form>
    </div>
</nav>

<h1 class="text-center text-danger">CAP QUYEN ADMIN</h1>

<c:if test="${errMsg != null}">
    <div class="alert alert-danger">
        ${errMsg}
    </div>
</c:if>

<ul class="pagination">
    <c:forEach begin="1" end="${Math.ceil(staffCounter/9)}" var="i">
        <c:url value="/sysadmin" var="s">
            <c:param value="${i}" name="page"  />
        </c:url>
        <li class="page-item"><a class="page-link" href="${s}"  >${i}</a></li>
        </c:forEach>
</ul>
<div class="row">
    <c:forEach var="s" items="${staff}">
        <div class="col-md-4 col-xs-12" style="padding: 10px">
            <div class="card">

                <c:choose>
                    <c:when test="${s.avatar != null && s.avatar.startsWith('https') == true}">
                        <img class="card-img-top img-fluid" src="${s.avatar}" alt="Card image">
                    </c:when>

                    <c:when test="${s.avatar == null || s.avatar.startsWith('https') == false}">
                        <img class="card-img-top img-fluid" src="<c:url value="/images/null-avata.png" />" alt="Card image">
                    </c:when>
                </c:choose>

                <div class="card-body">
                    <h4 class="card-title">${s.firstName}</h4>
                    <a href="<c:url value="/sysadmin/grant-permission/${s.id}" />" class="btn btn-primary">SUA NHAN VIEN</a>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
