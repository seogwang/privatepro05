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
    <title>상품상세보기</title>
</head>
<body>
<div class="content_wrap">
    <jsp:include page="../include/header.jsp" />
    <div class="content" style="display: flex; justify-content: center; align-items: center;" >
        <div class="form_wrap" style="margin-bottom: 10rem;">
            <h2 style="text-align: center; margin-bottom: 5rem;">상품상세보기</h2>
            <table class="pure-table">
                <tbody>
                <tr>
                    <td><img src="${path1}/resources/item/upload/${item.img1}" alt="${item.img1}" style="width: 300px; height: 300px; object-fit: cover;"></td>
                </tr>
                <tr>
                    <td><a href="${path1}/resources/item/upload/${item.img2}" download>${item.img2} 다운로드</a></td>
                </tr>
                <tr>
                    <th>카테고리</th>
                    <td>${item.cate }</td>
                </tr>
                <tr>
                    <th>상품명</th>
                    <td>${item.iname }</td>
                </tr>
                <tr>
                    <th>가격</th>
                    <td>${item.price }</td>
                </tr>
                <tr>
                    <th>상태</th>
                    <td>${item.stat }</td>
                </tr>
                <tr>
                    <th>상품설명</th>
                    <td>${item.des }</td>
                </tr>
                <tr>
                    <th>판매자</th>
                    <td>${item.uname }</td>
                </tr>
                <tr>
                    <th>연락처</th>
                    <td>${item.tel }</td>
                </tr>
                <tr>
                    <th>작성일</th>
                    <td>${item.resdate }</td>
                </tr>
                </tbody>
            </table>
        </div>
        </div>
    <jsp:include page="../include/footer.jsp" />
</div>
</body>
</html>