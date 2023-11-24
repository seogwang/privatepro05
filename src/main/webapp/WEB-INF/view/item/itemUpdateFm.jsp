<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal" />
</sec:authorize>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
    <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <jsp:include page="../include/head.jsp" />
    <title>상품정보수정</title>
</head>
<body>
<div class="content_wrap">
    <jsp:include page="../include/header.jsp" />
    <div class="content" style="display: flex; justify-content: center; align-items: center;" >
        <div class="form_wrap" style="margin-bottom: 10rem;">
            <h2 style="text-align: center; margin-bottom: 5rem;">상품정보수정</h2>
            <form class="pure-form pure-form-aligned" action="/item/itemUpdatePro" method="post" enctype="multipart/form-data">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <fieldset>
                    <div>
                        <img src="${path1}/resources/item/upload/${item.img1}" alt="${item.img1}" style="width: 300px; height: 300px; object-fit: cover;">
                    </div>
                    <div class="pure-control-group" id="file_add">
                        <input type="file" id="img1" name="files"/><br>
                        <input type="hidden" id="ino" name="ino" value="${item.ino}"/>
                        <input type="hidden" id="img1_1" name="files1" value="${item.img1}"/>
                    </div>
                    <label for="cate">카테고리</label>
                    <select id="cate" name="cate">
                        <option value="${item.cate}">${item.cate}</option>
                        <option value="교과서">교과서</option>
                        <option value="참고서">참고서</option>
                    </select>
                    <div class="pure-control-group">
                        <input type="text" id="iname" name="iname" value="${item.iname}" required/>
                        <input type="hidden" id="uname" name="uname" value="${name}" >
                    </div>
                    <div class="pure-control-group">
                        <input type="number" id="price" name="price" value="${item.price}" required/>
                    </div>
                    <div class="pure-control-group">
                        <textarea id="des" name="des" required>${item.des}</textarea>
                    </div>
                    <div class="pure-control-group">
                        <input type="tel" id="tel" name="tel" value="${item.tel}" required/>
                    </div>
                    <label for="stat">상태</label>
                    <select id="stat" name="stat">
                        <option value="${item.stat}">${item.stat}</option>
                        <option value="중고">중고</option>
                        <option value="새상품">새상품</option>
                    </select>
                    <div class="pure-controls">
                        <button type="submit" class="pure-button pure-button-primary">수정완료</button>
                    </div>
                </fieldset>
            </form>
        </div>
        </div>
    <jsp:include page="../include/footer.jsp" />
</div>
</body>
</html>