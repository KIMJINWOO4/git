<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<body>
	<form action="userUpdate.do" method="post" id="userUpdateForm">
		<table>
			<thead>
				<tr>
					<th colspan="2">회원정보</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>아이디</th>
					<td>${USER.userId }</td>
					<td><input type="hidden" value="${USER.userId }" name="userId"/></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pwd" id="pwdInput"/></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" id="pwdCheckInput"/></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" value="${USER.name }" name="name"/></td>
				</tr>
				<tr>
					<th>부서</th>
					<td>
						<select name="deptCd">
							<c:forEach items="${dept}" var="item">
								<option value="${item.deptCd}"
									<c:if test="${item.deptCd == USER.deptCd }">
										selected
									</c:if>
								><c:out value="${item.deptNm}"/></option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>직급</th>
					<td><input type="text" value="${USER.job }" name="job"/></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" value="${USER.phone }" name="phone"/></td>
				</tr>
				<tr>
					<th>메일</th>
					<td><input type="text" value="${USER.email }" name="email"/></td>
				</tr>
			</tbody>
		</table>
		
		<button type="button" onclick="window.history.back()">이전</button>
		<button type="button" id="okBtn">수정</button>
		<button type="button" id="delBtn">회원탈퇴</button>
	</form>
</body>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
<script>
	
	window.onload = function(){

		$("#okBtn").click(function() {
			var pwd = $("#pwdInput").val();
			var pwdCheck = $("#pwdCheckInput").val();
			
			if(pwd == pwdCheck){
				$("#userUpdateForm").submit();
			} else {
				alert("비밀번호를 확인해주세요.");
			}
		});
		
		$("#delBtn").click(function() {
			var del = confirm("탈퇴하시겠습니까?");
			if(del) {
				window.location.href='userDelete.do';
			} else {
				return false;
			}
		});
		
	} 
	
</script>
</html>