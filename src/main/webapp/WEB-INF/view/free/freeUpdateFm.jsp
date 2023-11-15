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
    <title>자유게시판 수정</title>
    <style>
        .button-error {
            background: rgb(202, 60, 60);
            /* this is a maroon */
        }
    </style>
</head>
<body>
<div class="content_wrap">
    <jsp:include page="../include/header.jsp" />
    <div class="content">
        <h2>자유게시판 수정</h2>

        <form action="/free/freeUpdatePro" class="pure-form pure-form-aligned" method="post">
            <fieldset>
                <div class="pure-control-group">
                    <label for="aligned-no">글번호</label>
                    <input type="text" id="aligned-no" name="no" value="${free.no}" readonly />
                </div>
                <div class="pure-control-group">
                    <label for="aligned-title">제목</label>
                    <input type="text" id="aligned-title" name="title" value="${free.title}" required />
                </div>
                <div class="pure-control-group">
                    <label for="aligned-content">내용</label>
                    <textarea id="aligned-content" name="content" required>${free.content}</textarea>
                </div>
                <div class="pure-control-group">
                    <label for="aligned-writer">작성자</label>
                    <input type="text" id="aligned-writer" value="${free.id}" readonly/>
                </div>
                <div class="pure-control-group">
                    <label for="aligned-resdate">작성일</label>
                    <input type="text" id="aligned-resdate" value="${free.resdate}" readonly/>
                </div>
                <div class="pure-control-group">
                    <label for="aligned-visit">조회수</label>
                    <input type="text" id="aligned-visit" value="${free.visit}" readonly/>
                </div>
                <div class="pure-controls">
                    <button type="submit" class="pure-button pure-button-primary">수정 완료</button>
                </div>
            </fieldset>
        </form>
    </div>

    <jsp:include page="../include/footer.jsp" />
</div>
</body>
</html>