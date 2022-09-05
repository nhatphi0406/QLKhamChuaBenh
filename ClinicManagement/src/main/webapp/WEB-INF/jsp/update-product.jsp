<%-- 
    Document   : update-product
    Created on : 26 Aug 2022, 13:07:11
    Author     : nhatp
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:if test="${errMsg != null}">
    <div class="alert alert-danger">
        ${errMsg}
    </div>
</c:if>

<c:url value="/admin/products/update-product/${product.id}" var="action" />

<h1 class="text-center text-danger">CAP NHAT SAN PHAM</h1>
<div class="row">
    <div class="col-md-6">
        <c:choose>
            <c:when test="${product.image != null && product.image.startsWith('https') == true}">
                <img class="card-img-top img-fluid" src="${product.image}" alt="${product.name}" />
            </c:when>

            <c:when test="${product.image == null || product.image.startsWith('https') == false}">
                <img class="card-img-top img-fluid" src="<c:url value="/images/null-product.png" />" alt="${product.name}" />
            </c:when>
        </c:choose>
    </div>
    <div class="col-md-6">
        <form:form method="post" action="${action}" modelAttribute="product">
            <div class="form-group">
                <label for="description">Mo to san pham</label>
                <form:textarea id="description" path="description" class="form-control" />
            </div>
            <div class="form-group">
                <form:errors path="price" class="text-danger" element="div" />
                <label for="price">Gia</label>
                <form:input type="text" id="price" path="price" class="form-control" />
            </div>
            <div class="form-group">
                <input type="submit" value="SUA SAN PHAM" class="btn btn-danger" />
            </div>
        </form:form>
    </div>
</div>
