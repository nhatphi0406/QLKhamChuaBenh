<%-- 
    Document   : staff
    Created on : 31 Aug 2022, 10:34:44
    Author     : nhatp
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-md bg-dark navbar-dark">
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <form class="form-inline" action="<c:url value="/admin/staff" />">
            <input class="form-control mr-sm-2" name="kw" type="text" placeholder="Nhap tu khoa...">
            <button class="btn btn-success" type="submit">Tim</button>
        </form>
    </div>
</nav>

<h1 class="text-center text-danger">QUAN LY NHAN VIEN</h1>

<br>
<a href="<c:url value="/admin/staff/add-staff" />" class="btn btn-primary">THEM NHAN VIEN</a>
<br><br>

<ul class="pagination">
    <c:forEach begin="1" end="${Math.ceil(staffCounter/9)}" var="i">
        <c:url value="/admin/staff" var="s">
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
                    <a href="<c:url value="/admin/staff/staff-detail/${s.id}" />" class="btn btn-primary">Xem chi tiet</a>
                    <a href="<c:url value="/admin/staff/delete-staff/${s.id}" />" class="btn btn-primary">Xoa nhan vien</a>
                    <br><br>
                    <a href="<c:url value="/admin/staff/update-staff/${s.id}" />" class="btn btn-primary">Sua nhan vien</a>
                </div>
            </div>
        </div>
    </c:forEach>
</div>