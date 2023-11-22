<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
  <sec:authentication property="principal" var="principal" />
</sec:authorize>
<c:set var="path1" value="${pageContext.request.contextPath }" />

<div class="pure-g" style="align-items: center; margin-top: 2rem;">
  <div class="pure-u-1 pure-u-xl-1-4"><a href="/" class="pure-menu-heading" style="font-weight: bold">T-FleaMarket</a></div>
  <div class="pure-u-1 pure-u-xl-1-2">
    <form id="searchthis" action="/" style="display:inline;" method="get">
      <!-- Search box for blogger by Namanyay Goel //-->
      <button type="submit" style="border: 0;"><i class="icono-search"></i></button>
      <input id="namanyay-search-box" name="q" size="40" type="text" placeholder="어떤 상품을 찾으시나요?"/>
      <input id="namanyay-search-btn" value="검색" type="submit"/>
    </form>
  </div>
  <div class="pure-u-1 pure-u-xl-1-4">
    <div class="pure-menu pure-menu-horizontal">
      <ul class="pure-menu-list">
        <c:if test="${empty principal}">
<%--              <li class="pure-menu-item pure-menu-link">--%>
<%--                <a href="/login" class="pure-menu-link">채팅하기</a>--%>
<%--              </li>--%>
              <li class="pure-menu-item pure-menu-link">
                <a href="/login" class="pure-menu-link">상품등록</a>
              </li>
              <li class="pure-menu-item pure-menu-link">
                <a href="/login" class="pure-menu-link">로그인</a>
              </li>
        </c:if>
        <c:if test="${not empty principal}">
<%--          <li class="pure-menu-item pure-menu-link">--%>
<%--            <a href="/" class="pure-menu-link">채팅하기</a>--%>
<%--          </li>--%>
          <li class="pure-menu-item pure-menu-link">
            <a href="/item/itemInsertFm" class="pure-menu-link">상품등록</a>
          </li>
        </c:if>
        <c:if test="${not empty principal}">
        <li class="pure-menu-item pure-menu-has-children pure-menu-allow-hover">
          <a href="#" id="menuLink1" class="pure-menu-link">${username} 님</a>
          <ul class="pure-menu-children">
            <li class="pure-menu-item">
              <a href="/userUpdateFm?id=${principal}" class="pure-menu-link">마이페이지</a>
            </li>
            <li class="pure-menu-item">
              <a href="/logout" class="pure-menu-link">로그아웃</a>
            </li>
          </ul>
        </li>
        </c:if>
      </ul>
    </div>
  </div>
</div>

<div class="pure-menu pure-menu-horizontal">
  <ul class="pure-menu-list">
    <li class="pure-menu-item pure-menu-has-children pure-menu-allow-hover">
      <a href="#" id="menuLink2" class="pure-menu-link">카테고리</a>
      <ul class="pure-menu-children">
        <li class="pure-menu-item">
          <a href="/item/list2?cate=교과서" class="pure-menu-link">교과서</a>
        </li>
        <li class="pure-menu-item">
          <a href="/item/list2?cate=참고서" class="pure-menu-link">참고서</a>
        </li>
      </ul>
    </li>
    <li class="pure-menu-item"><a href="/free/list" class="pure-menu-link">자유게시판</a></li>
  </ul>
</div>