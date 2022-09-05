<%-- 
    Document   : add-product
    Created on : 21 Aug 2022, 13:34:07
    Author     : nhatp
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h1 class="text-center text-danger">THEM SAN PHAM</h1>

<c:if test="${errMsg != null}">
    <div class="alert alert-danger">
        ${errMsg}
    </div>
</c:if>

<c:url value="/admin/products/add-product" var="action" />

<form:form method="post" action="${action}" 
           enctype="multipart/form-data" modelAttribute="product">
    
    <div class="form-group">
        <form:errors path="name" class="text-danger" element="div" />
        <label for="name">Ten</label>
        <form:input type="text" id="name" path="name" class="form-control" />
    </div>
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
        <label for="cate">Danh muc</label>
        <form:select id="cate" path="categoryId" class="form-control">
            <c:forEach items="${categories}" var="cat">
                <option value="${cat.id}">${cat.name}</option>
            </c:forEach>
        </form:select>
    </div>
    <div class="form-group">
        <label for="file">Anh san pham</label>
        <form:input type="file" class="form-control" id="file" path="file" />
    </div>
    <div class="form-group">
        <input type="submit" value="THEM SAN PHAM" class="btn btn-danger" />
    </div>
</form:form>
