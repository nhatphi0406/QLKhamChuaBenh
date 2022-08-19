<%-- 
    Document   : product
    Created on : 19 Aug 2022, 15:40:31
    Author     : nhatp
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-md bg-dark navbar-dark">

    <!-- Toggler/collapsibe Button -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Navbar links -->
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav">

            <c:forEach var="c" items="${categories}">
                <li class="nav-item">
                    <c:url value="/doctor/products" var="catPath">
                        <c:param name="CateId" value="${c.id}"></c:param>
                    </c:url>
                    <a class="nav-link" href="${catPath}">${c.name}</a>
                </li>
            </c:forEach>
            <li class="nav-item">
                <a href="<c:url value="/doctor/product/prescription" />" class="nav-link text-success">
                    <i class="fas fa-cart-plus"></i>
                    <div class="badge badge-danger" >0</div> 
                </a>
            </li>

        </ul>
        <form class="form-inline" action="<c:url value="/doctor/products" />">
            <input class="form-control mr-sm-2" name="kw" type="text" placeholder="Nhap tu khoa...">
            <button class="btn btn-success" type="submit">Tim</button>
        </form>
    </div>
</nav>

<h1 class="text-center text-danger">QUAN LY THUOC</h1>

<ul class="pagination">
    <c:forEach begin="1" end="${Math.ceil(productCounter/9)}" var="i">
        <c:url value="/doctor/products" var="c">
            <c:param value="${i}" name="page"  />
        </c:url>
        <li class="page-item"><a class="page-link" href="${c}">${i}</a></li>
        </c:forEach>
</ul>
<div class="row">
    <c:forEach var="p" items="${products}">
        <div class="col-md-4 col-xs-12" style="padding: 10px">
            <div class="card">
                <a href="<c:url value="/doctor/products/product-detail/${p.id}" />">
                    <c:choose>
                        <c:when test="${p.image != null && p.image.startsWith('https') == true}">
                            <img class="card-img-top img-fluid" src="${p.image}" alt="Card image">
                        </c:when>

                        <c:when test="${p.image == null || p.image.startsWith('https') == false}">
                            <img class="card-img-top img-fluid" src="<c:url value="/images/null-product.png" />" alt="Card image">
                        </c:when>
                    </c:choose>
                </a>

                <div class="card-body">
                    <h4 class="card-title">${p.name}</h4>
                    <p class="card-text">${p.price} VND</p>
                    <a href="#" class="btn btn-primary">Dat hang</a>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
