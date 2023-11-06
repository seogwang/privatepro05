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
    <jsp:include page="./include/head.jsp" />
    <title>회원가입</title>
</head>
<body>

<jsp:include page="./include/header.jsp" />

<h2>회원가입</h2>

<form class="pure-form pure-form-aligned" action="/userInsertPro" method="post" onsubmit="return joinConfirm(this)">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <fieldset>
        <div class="pure-control-group">
            <input type="text" id="id" name="name" placeholder="아이디" required/>
            <button type="button" id="idCheckBtn" class="pure-button pure-button-primary">아이디 중복 체크</button>
            <input type="hidden" name="idCheck" id="idCheck" value="false">
            <div id="msg"></div>
        </div>
        <div class="pure-control-group">
            <input type="password" id="password" name="password" placeholder="비밀번호" required/>
        </div>
        <div class="pure-control-group">
            <input type="password" id="password2" name="password2" placeholder="비밀번호확인" required/>
        </div>
        <div class="pure-control-group">
            <input type="text" id="username" name="username" placeholder="이름" required/>
        </div>
        <div class="pure-control-group">
            <input type="email" id="email" name="email" placeholder="이메일" required/>
            <button type="button" id="emailCheckBtn" class="pure-button pure-button-primary">이메일 중복 체크</button>
            <input type="hidden" name="emailCheck" id="emailCheck" value="false">
            <div id="msg2"></div>
        </div>
        <div class="pure-control-group">
            <input type="text" id="address" name="address" placeholder="주소" required/>
        </div>
        <div class="pure-control-group">
            <input type="tel" id="tel" name="tel" placeholder="전화번호" required/>
        </div>
        <div class="pure-controls">
            <button type="submit" class="pure-button pure-button-primary">회원가입</button>
        </div>
    </fieldset>
</form>
<script>
    $(document).ready(function(){
        $("#idCheckBtn").click(function() {
           if($("#id").val()==""){
                alert("아이디를 입력하지 않으셨습니다.");
                $("#id").focus();
                return;
           }
           var test = { name : $("#id").val() };
           $.ajax({
               url:"${path1}/idCheck",
               type:"post",
               data:JSON.stringify(test),
               dataType:"json",
               contentType:"application/json",
               success:function(result){
                   console.log(result);
                   var idChk = result;
                   if(idChk==false){
                       $("#idCheck").val("false");
                       $("#msg").html("<strong style='color:red'>사용중인 아이디입니다.</strong>");
                       $("#id").focus();
                   } else if (idChk==true) {
                       $("#idCheck").val("true");
                       $("#msg").html("<strong style='color:blue'>사용 가능한 아이디입니다.</strong>");
                   } else if (idChk=="") {
                       $("#msg").html("<strong>아이디가 확인되지 않습니다. 다시 시도해주시기 바랍니다.</strong>");
                   }
               }
           });
        });
    });

    $(document).ready(function(){
        $("#emailCheckBtn").click(function (){
            if($("#email").val() == "") {
                alert("이메일을 입력하지 않으셨습니다.")
                $("#email").focus();
                return;
            }
            var params = { email : $("#email").val() };
            $.ajax({
                url:"${path1}/emailCheck",
                type:"post",
                dataType:"json",
                data:params,
                success:function(result){
                    console.log(result);
                    var emailChk = result;
                    if(emailChk == false) {
                        $("#emailCheck").val("false");
                        $("#msg2").html("<strong style='color:red'>사용되고 있는 이메일입니다. 다시 입력해주시기 바랍니다.</strong>");
                        $("#email").focus();
                    } else if (emailChk == true) {
                        $("#emailCheck").val(true);
                        $("#msg2").html("<strong style='color:blue'>사용가능한 이메일입니다.</strong>");
                    } else if (emailChk == "") {
                        $("#msg2").html("<strong>이메일이 확인되지 않습니다. 다시 시도해주시기 바랍니다.</strong>");
                    }
                }
            });
        });
    });

    function joinConfirm(f) {
        if(f.password.value!=f.password2.value){
            alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
            f.password.focus();
            return false;
        }
    }
</script>

<jsp:include page="./include/footer.jsp" />

</body>
</html>