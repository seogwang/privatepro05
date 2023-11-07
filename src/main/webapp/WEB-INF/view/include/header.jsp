<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
  <sec:authentication property="principal" var="principal" />
</sec:authorize>
<c:set var="path1" value="${pageContext.request.contextPath }" />

<div class="pure-menu pure-menu-horizontal">
  <a href="/" class="pure-menu-heading" style="font-weight: bold">T-FleaMarket</a>
  <ul class="pure-menu-list">
    <li class="pure-menu-item"><a href="/free/list" class="pure-menu-link">게시판</a></li>

    <c:if test="${empty principal}">
    <li class="pure-menu-item"><a href="/join" class="pure-menu-link">회원가입</a></li>
    <li class="pure-menu-item"><a href="/login" class="pure-menu-link">로그인</a></li>
    </c:if>

    <c:if test="${not empty principal}">
      <li class="pure-menu-item"><a href="/userUpdateFm?id=${principal}" class="pure-menu-link">마이페이지</a></li>
      <li class="pure-menu-item"><a href="/logout" class="pure-menu-link">로그아웃</a></li>

    </c:if>
<%--    <li class="pure-menu-item pure-menu-selected"><a href="#" class="pure-menu-link">Pricing</a></li>--%>
<%--    <li class="pure-menu-item"><a href="#" class="pure-menu-link">Contact</a></li>--%>
<%--      <li class="pure-menu-item">Principal : ${principal}</li>--%>
  </ul>
</div>