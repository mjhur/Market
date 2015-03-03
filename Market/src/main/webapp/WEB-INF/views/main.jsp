<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<title>Home</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">
	
function login(){
	var id = $("#id").val();
	var pw = $("#pw").val();
	
	$("#alertMsg").html("");
	
	if(id == null || id == "" || pw == null || pw == ""){
		alert("아이디나 비밀번호가 입력되지 않았습니다.");
		return;
	}
	
	$.ajax({
		type: "POST",
		url : "/member/login.do",
		data: {id:id, pw:pw},
		async: false,
		success: function(flag){
			if(flag == false){
				$("#alertMsg").append("Please check ID and Password");
			} else {
				alert("success");
			}
		}
		
	});
	
}

function goJoinPage(){
	location.href="/member/joinPage.do";
}

</script>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<p>

id : <input type="text" id="id" value="${id}"/><br/>
pw : <input type="text" id="pw" value="${pw}"/>
<button onclick="javascript:login();">로그인</button><br/>
<span id="alertMsg"></span><br/><br/>
<button onclick="javascript:goJoinPage();">회원가입</button><br/>
</p>

</body>
</html>
