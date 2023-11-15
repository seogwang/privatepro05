<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <jsp:include page="include/head.jsp" />
<body>
<div class="content_wrap">
    <jsp:include page="./include/header.jsp" />
    <div class="content">
        <form class="pure-form pure-form-aligned" action="${path1}/auth" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <fieldset>
                <div class="pure-control-group">
                    <label for="aligned-name">아이디</label>
                    <input type="text" id="aligned-name" name="name" placeholder="아이디" />
                    <span class="pure-form-message-inline">Ajax 구현 부분</span>
                </div>
                <div class="pure-control-group">
                    <label for="aligned-password">비밀번호</label>
                    <input type="password" id="aligned-password" name="password" placeholder="비밀번호" />
                </div>
                <div class="pure-controls">
                    <button type="submit" class="pure-button pure-button-primary">로그인</button>
                </div>
            </fieldset>
        </form>
    </div>
    <jsp:include page="./include/footer.jsp" />
</div>
</body>
</html>