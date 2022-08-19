<%-- 
    Document   : header
    Created on : 19 Aug 2022, 15:29:25
    Author     : nhatp
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-md bg-dark navbar-dark">
    <!-- Brand -->
    <a class="navbar-brand" href="/">CLINIC MANAGEMENT</a>

    <!-- Toggler/collapsibe Button -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Navbar links -->
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav">

            <c:if test="${pageContext.request.userPrincipal.name == null}">
                <li class="nav-item">
                    <a href="<c:url value="/login" />" class="nav-link text-danger">
                        <i class="fa fa-user" aria-hidden="true"></i> Dang nhap
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<c:url value="/register" />" class="nav-link text-danger">
                        <i class="fa fa-check" aria-hidden="true"></i> Dang ky
                    </a>
                </li>
            </c:if>

            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <li class="nav-item">
                    <a href="<c:url value="/" />" class="nav-link text-success">
                        <c:if test="${currentUser.avatar != null}">
                            <img style="width:30px;" src="${currentUser.avatar}" class="rounded-circle" />
                        </c:if>
                        <c:if test="${currentUser.avatar == null}">
                            <i class="fa fa-user" aria-hidden="true"></i>
                        </c:if>

                        ${pageContext.request.userPrincipal.name}
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<c:url value="/logout" />" class="nav-link text-success">
                        Dang xuat
                    </a>
                </li>
            </c:if>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <li>
                    <a href="<c:url value="/admin/products"/>" class="nav-link text-danger">Quan ly thuoc</a>
                </li>
                <li>
                    <a href="<c:url value="/admin/staff"/>" class="nav-link text-danger">Quan nhan vien</a>
                </li>
            </sec:authorize> 
        </ul>
    </div>
</nav>
