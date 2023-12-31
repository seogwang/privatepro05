<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />

<link rel="stylesheet" href="${path1}/resources/css/pure-min.css">
<%--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css" integrity="sha384-X38yfunGUhNzHpBaEBsWLO+A0HDYOQi8ufWDkZ0k9e0eXz/tH3II7uKZ9msv++Ls" crossorigin="anonymous">--%>
<link rel="stylesheet" href="${path1}/resources/css/grids-responsive-min.css">
<link rel="stylesheet" href="${path1}/resources/css/styles.css">
<link rel="stylesheet" href="${path1}/resources/css/icono.min.css">
<%--<link rel="stylesheet" href="https://icono-49d6.kxcdn.com/icono.min.css">--%>


<style>
    .content { min-height: 82vh; width: 1080px; margin: 0 auto; }
    .content_wrap { width: 1280px; clear: both; margin: 0 auto; }

     .button-success,
     .button-error,
     .button-warning,
     .button-secondary {
         color: white;
         border-radius: 4px;
         text-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
     }

    .button-success {
        background: rgb(28, 184, 65);
        /* this is a green */
    }

    .button-error {
        background: rgb(202, 60, 60);
        /* this is a maroon */
    }

    .button-warning {
        background: rgb(223, 117, 20);
        /* this is an orange */
    }

    .button-secondary {
        background: rgb(66, 184, 221);
        /* this is a light blue */
    }
</style>