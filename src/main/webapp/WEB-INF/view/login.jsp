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
    <div class="content" style="display: flex; justify-content: center; align-items: center">
        <div class="form_wrap">
            <img src="${path1}/resources/images/logo.jpg">
            <p style="font-size: 1.5em; font-weight: bold; margin-bottom: 5rem;">
                T-Flea Market에 오신 것을<br>
                환영합니다.
            </p>
            <form class="pure-form pure-form-aligned" action="${path1}/auth" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <fieldset style="margin-bottom: 10rem;" >
                    <div class="pure-control-group">
                        <input type="text" id="aligned-name" name="name" placeholder="아이디" style="width: 100%;" />
<%--                        <span class="pure-form-message-inline">Ajax 구현 부분</span>--%>
                    </div>
                    <div class="pure-control-group">
                        <input type="password" id="aligned-password" name="password" placeholder="비밀번호" style="width: 100%;" />
                    </div>
                    <div style="width: 100%; text-align: center; margin-top: 20px; " >
                        <button type="submit" class="pure-button pure-button-primary" style="width: 100%;">로그인</button>
                    </div>
                    <div style="text-align: center; width: 100%; margin-top: 20px; ">
                        <a href="/join" >회원가입</a>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
    <jsp:include page="./include/footer.jsp" />
</div>
</body>
</html>