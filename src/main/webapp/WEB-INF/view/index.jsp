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
</head>
<body>

<jsp:include page="./include/header.jsp" />

<div class="banner">
    <h1 class="banner-head">
        천재교육 선생님들을 위한<br>
        온라인 중고시장 'T-FleaMarket' 입니다.
    </h1>
</div>

<%--<div class="l-content">--%>
<%--    <div class="pricing-tables pure-g">--%>
<%--        <div class="pure-u-1 pure-u-md-1-3">--%>
<%--            <div class="pricing-table pricing-table-free">--%>
<%--                <div class="pricing-table-header">--%>
<%--                    <h2>Personal</h2>--%>

<%--                    <span class="pricing-table-price">--%>
<%--                        $5 <span>per month</span>--%>
<%--                    </span>--%>
<%--                </div>--%>

<%--                <ul class="pricing-table-list">--%>
<%--                    <li>Free setup</li>--%>
<%--                    <li>Custom sub-domain</li>--%>
<%--                    <li>Standard customer support</li>--%>
<%--                    <li>1GB file storage</li>--%>
<%--                    <li>1 database</li>--%>
<%--                    <li>Unlimited bandwidth</li>--%>
<%--                </ul>--%>

<%--                <button class="button-choose pure-button">Choose</button>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div class="pure-u-1 pure-u-md-1-3">--%>
<%--            <div class="pricing-table pricing-table-biz pricing-table-selected">--%>
<%--                <div class="pricing-table-header">--%>
<%--                    <h2>Small Business</h2>--%>

<%--                    <span class="pricing-table-price">--%>
<%--                        $25 <span>per month</span>--%>
<%--                    </span>--%>
<%--                </div>--%>

<%--                <ul class="pricing-table-list">--%>
<%--                    <li>Free setup</li>--%>
<%--                    <li>Use your own domain</li>--%>
<%--                    <li>Standard customer support</li>--%>
<%--                    <li>10GB file storage</li>--%>
<%--                    <li>5 databases</li>--%>
<%--                    <li>Unlimited bandwidth</li>--%>
<%--                </ul>--%>

<%--                <button class="button-choose pure-button">Choose</button>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div class="pure-u-1 pure-u-md-1-3">--%>
<%--            <div class="pricing-table pricing-table-enterprise">--%>
<%--                <div class="pricing-table-header">--%>
<%--                    <h2>Enterprise</h2>--%>

<%--                    <span class="pricing-table-price">--%>
<%--                        $45 <span>per month</span>--%>
<%--                    </span>--%>
<%--                </div>--%>

<%--                <ul class="pricing-table-list">--%>
<%--                    <li>Free setup</li>--%>
<%--                    <li>Use your own domain</li>--%>
<%--                    <li>Premium customer support</li>--%>
<%--                    <li>Unlimited file storage</li>--%>
<%--                    <li>25 databases</li>--%>
<%--                    <li>Unlimited bandwidth</li>--%>
<%--                </ul>--%>

<%--                <button class="button-choose pure-button">Choose</button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div> <!-- end pricing-tables -->--%>

<%--    <div class="information pure-g">--%>
<%--        <div class="pure-u-1 pure-u-md-1-2">--%>
<%--            <div class="l-box">--%>
<%--                <h3 class="information-head">Get started today</h3>--%>
<%--                <p>--%>
<%--                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.--%>
<%--                </p>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div class="pure-u-1 pure-u-md-1-2">--%>
<%--            <div class="l-box">--%>
<%--                <h3 class="information-head">Pay monthly or annually</h3>--%>
<%--                <p>--%>
<%--                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamco laboris nisi ut aliquip ex ea commodo--%>
<%--                    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse.--%>
<%--                </p>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div class="pure-u-1 pure-u-md-1-2">--%>
<%--            <div class="l-box">--%>
<%--                <h3 class="information-head">24/7 customer support</h3>--%>
<%--                <p>--%>
<%--                    Cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.--%>
<%--                </p>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div class="pure-u-1 pure-u-md-1-2">--%>
<%--            <div class="l-box">--%>
<%--                <h3 class="information-head">Cancel your plan anytime</h3>--%>
<%--                <p>--%>
<%--                    Duis aute irure dolor in reprehenderit in voluptate velit esse--%>
<%--                    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.--%>
<%--                </p>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div> <!-- end information -->--%>
<%--</div> <!-- end l-content -->--%>

<jsp:include page="./include/footer.jsp" />
</body>
</html>