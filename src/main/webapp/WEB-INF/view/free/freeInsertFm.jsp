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
    <title>자유게시판 글쓰기</title>
</head>
<body>
<div class="content_wrap">
    <jsp:include page="../include/header.jsp" />
    <div class="content">
        <h2>자유게시판 글쓰기</h2>
        <form action="/free/freeInsertPro" class="pure-form" method="post" >
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <fieldset class="pure-group">
                <input type="hidden" id="id" name="id" value="${principal}" />
                <input type="text" id="title" name="title" class="pure-input-1-2" placeholder="제목" />
            </fieldset>
            <fieldset class="pure-group">
                <textarea id="content" name="content" class="pure-input-1-2" placeholder="내용"></textarea>
            </fieldset>
            <button type="submit" class="pure-button pure-input-1-2 pure-button-active">글 등록</button>
        </form>
    </div>

    <jsp:include page="../include/footer.jsp" />
</div>
</body>
</html>