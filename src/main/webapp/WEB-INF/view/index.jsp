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
    <jsp:include page="include/head.jsp" />
    <title>T-FleaMarket</title>
    <style>
        .item_ul { list-style: none; }
        .itme_li { float: left; margin-right: 20px; }

        li:nth-child(3n+1) { clear: both; }

        a { text-decoration: none; }

        .main_text { margin-top: 50px; line-height: 2.5rem; font-size: 1.5rem; }
    </style>
</head>
<body>
<div class="content_wrap">
<%--    <div class="banner">--%>
<%--        <h1 class="banner-head">--%>
<%--            천재교육 선생님들의 온라인 중고시장 'T-FleaMarket' !--%>
<%--        </h1>--%>
<%--    </div>--%>
    <jsp:include page="./include/header.jsp" />
    <div class="content">
        <div class="main_text">
            천재교육 선생님들의 중고거래 장터 <br>
            T-FleaMarket에 오신 것을 환영합니다!
        </div>
        <div class="list_wrap" style="margin-bottom: 10rem; clear:both; text-align: center; ">
            <ul class="item_ul" style="clear: both; width: 1280px; margin: 20px auto; list-style: none; height: auto;">
                <c:if test="${empty itemList}"><p>해당 상품이 존재하지 않습니다.</p></c:if>
                <c:forEach var="item" items="${itemList}">
                    <li class="itme_li">
                        <div>
                            <a href="${path1}/item/itemDetail?ino=${item.ino}">
                                <p style="width: 300px; height: 300px; overflow: hidden; object-fit: cover; ">
                                    <img src="${path1}/resources/item/upload/${item.img1}" alt="${item.img1}" style="width: 300px; height: 300px; object-fit: cover;">
                                </p>
                                <div>
                                    <h4>${item.iname}</h4>
                                    <p>가격 : ${item.price}원</p>
                                </div>
                            </a>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <jsp:include page="./include/footer.jsp" />
</div>
</body>
</html>