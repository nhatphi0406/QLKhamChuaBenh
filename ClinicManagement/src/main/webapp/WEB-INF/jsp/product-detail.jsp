<%-- 
    Document   : product-detail
    Created on : 24 Aug 2022, 14:15:41
    Author     : nhatp
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<h1 class="text-center text-danger">CHI TIET SAN PHAM</h1>
<div class="row">
    <div class="col-md-6">
        <c:choose>
            <c:when test="${product.image != null && product.image.startsWith('https') == true}">
                <img class="card-img-top img-fluid" src="${product.image}" alt="${product.name}" />
            </c:when>

            <c:when test="${product.image == null || product.image.startsWith('https') == false}">
                <img class="card-img-top img-fluid" src="<c:url value="/images/default.png" />" alt="${product.name}" />
            </c:when>
        </c:choose>
    </div>
    <div class="col-md-6">
        <h1>${product.name}</h1>
        <h3 class="card-text text-danger"> Gia: 
            <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${product.price}" /> VND
        </h3>
        <h3>Danh muc: ${product.categoryId}</h3>
        <p>${product.description}</p>
        <br>
    </div>
</div>
