<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
<title>Join</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">
	
function idCheck(){
	var id = $("#usr_id").val();
	
	$.ajax({
		type: "POST",
		url : "/member/idCheck.do",
		data: {usrId:id},
		async: false,
		success: function(msg){
			if(msg == "false"){
				alert(id + " 사용불가");
			} else {
				alert(id + " 사용가능");
			}
		}
		
	});
	
}

function join(){
	if($("#agree").prop("checked") == false){
		return;	
	}
	$("#phone_number").val( $("#phone1").val()+$("#phone2").val()+$("#phone3").val() );
	$("#mobile_number").val( $("#moblie1").val()+$("#moblie2").val()+$("#moblie3").val() );
	$("#userInfo").attr("action","/member/join.do");
	$("#userInfo").submit();
}
</script>
</head>
<body>
<h1>
	회원가입
</h1>


<form id="userInfo" name="userInfo"  >

아이디<br/>
<input type="text" id="usr_id" name="usr_id"/> <button onclick="javascript:idCheck();">중복확인</button>
<p></p>


비밀번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호확인<br/>
<input type="text" id="pw" name="pw"/>&nbsp;<input type="text" id="re_pw" name="re_pw"/><br/><br/>  

비밀번호 힌트&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 비밀번호 답변<br/>
<input type="text" id="pw_hint" name="pw_hint"/>&nbsp;<input type="text" id="pw_answer" name="pw_answer"/><br/><br/>    

회원정보<br/>
<table border="0">
	<tr>
		<td>이름	</td><td><input type="text" id="usr_name" name="usr_name"/></td>
	</tr>
	<tr>
		<td>전화번호</td><td><select id="phone1"><option>02</option><option>051</option><option>032</option></select>-<input type="text" id="phone2" style="width:50px" maxlength="4"/>-<input type="text" id="phone3" style="width:50px" maxlength="4"/>
		<input type="hidden" id="phone_number" name="phone_number"/>
		</td>
	</tr>
	<tr>
		<td>휴대폰번호</td><td><select id="moblie1"><option>010</option><option>101</option><option>700</option></select>-<input type="text" id="moblie2" style="width:50px" maxlength="4"/>-<input type="text" id="moblie3" style="width:50px" maxlength="4"/>
			<input type="hidden" id="mobile_number" name="mobile_number"/> 
			SMS수신동의 <input type="checkbox" id="contact_yn" name="contact_yn"/></td>
	</tr>
	<tr>
		<td colspan="2"><center><input type="checkbox" id="agree" name="agree"/>개인정보 수집 및 이용에 동의합니다.</center></td>
	</tr>
	<tr>
		<td colspan="2"><center><a href="#" onclick="javascript:join();">가입완료</a></center></td>
	</tr>
</table>
</form>

</body>
</html>
