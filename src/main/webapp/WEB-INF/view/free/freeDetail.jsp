<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
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
    <title>자유게시판 상세보기</title>
    <style>
        .button-error {
            background: rgb(202, 60, 60);
            /* this is a maroon */
        }
    </style>
</head>
<body>

<jsp:include page="../include/header.jsp" />
<div class="content">
    <h2>자유게시판 상세보기</h2>
    <table class="pure-table">
        <tbody>
        <tr>
            <th>제목</th>
            <td>${free.title }</td>
        </tr>
        <tr>
            <th>내용</th>
            <td>${free.content }</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${free.id }</td>
        </tr>
        <tr>
            <th>작성일</th>
            <td>${free.resdate }</td>
        </tr>
        <tr>
            <th>조회수</th>
            <td>${free.visit }</td>
        </tr>
        </tbody>
    </table>

    <a class="button-error pure-button" href="/free/freeDelete?no=${free.no }">글삭제</a>

</div>

<jsp:include page="../include/footer.jsp" />

</body>
</html>