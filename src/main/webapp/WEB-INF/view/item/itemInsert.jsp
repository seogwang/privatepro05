<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
<body>

<div class="content">
    <form action="/item/itemInsertPro" method="post" enctype="multipart/form-data">
        <input type="text" placeholder="상품명" name="iname" required>
        <input type="number" placeholder="가격" name="price" required>
        <input type="file" value="파일선택" name="file" placeholder="상품이미지" required>
        <button type="button" id="addImg">+</button>
        <input type="submit" value="전송">
    </form>
    <script>

    </script>
</div>

</body>
</html>