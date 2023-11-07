<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <title>자유게시판 목록</title>
    <style>
        .free_wrap {  }
        table { width: 100%; }
        table th:nth-child(1) { width: 10%; }
        table th:nth-child(2) { width: 50%; }
        table th:nth-child(3) { width: 10%; }
        table th:nth-child(4) { width: 10%; }
        table th:nth-child(5) { width: 10%; }
    </style>
</head>
<body>

<jsp:include page="../include/header.jsp" />
<div class="content">
    <div class="free_wrap">
        <h2>자유게시판 목록</h2>
        <table class="pure-table">
            <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${freeList }" var="list" varStatus="status">
            <tr>
                <td>${status.index + 1 }</td>
                <td><a href="${path1 }/free/freeDetail?no=${list.no }">${list.title }</a></td>
                <td>${list.id }</td>
                <fmt:parseDate value="${list.resdate}" pattern="yyyy-MM-dd" var="date" />
                <td><fmt:formatDate value="${date}" pattern="yyyy.MM.dd" /></td>
                <td>${list.visit }</td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
        <a class="pure-button pure-button-active" href="${path1}/free/freeInsertFm" style="float:right;">글쓰기</a>
    </div>
</div>

<jsp:include page="../include/footer.jsp" />

</body>
</html>