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
    <title>회원정보 수정</title>
</head>
<body>

<jsp:include page="../include/header.jsp" />
<div class="content">
    <h2>회원정보 수정</h2>
    <form class="pure-form pure-form-aligned" action="${path1 }/userUpdatePro" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <fieldset>
            <div class="pure-control-group">
                <label for="name">아이디</label>
                <input type="hidden" name="id" id="id" value="${user.id}"/>
                <input type="text" id="name" name="name" value="${user.name }" readonly/>
                <span class="pure-form-message-inline">This is a required field.</span>
            </div>
            <div class="pure-control-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password" value="${user.password }" required/>
            </div>
            <div class="pure-control-group">
                <label for="username">이름</label>
                <input type="text" id="username" name="username" value="${user.username }" required/>
            </div>
            <div class="pure-control-group">
                <label for="email">이메일</label>
                <input type="email" id="email" name="email" value="${user.email }" required/>
            </div>
            <div class="pure-control-group">
                <label for="address">주소</label>
                <input type="text" id="address" name="address" value="${user.address }" required/>
            </div>
            <div class="pure-control-group">
                <label for="tel">전화번호</label>
                <input type="tel" id="tel" name="tel" value="${user.tel }" required/>
            </div>
            <div class="pure-controls">
                <button type="submit" class="pure-button pure-button-primary">회원정보수정</button>
            </div>
        </fieldset>
    </form>
</div>
<jsp:include page="../include/footer.jsp" />

</body>
</html>