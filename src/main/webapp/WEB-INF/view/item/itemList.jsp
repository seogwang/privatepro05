<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" isELIgnored="false" %>
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
    <title>상품목록</title>
    <style>
        .item_ul { list-style: none; }
        .itme_li { float: left; margin-right: 20px; }

        a { text-decoration: none; }
    </style>
</head>
<body>
<div class="content_wrap">
    <jsp:include page="../include/header.jsp" />
    <div class="content" style="display: flex; justify-content: center; align-items: center;" >
        <div class="list_wrap" style="margin-bottom: 10rem;">
            <ul class="item_ul" style="width:1280px;margin:20px auto;list-style:none;">
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
    <jsp:include page="../include/footer.jsp" />
</div>
</body>
</html>