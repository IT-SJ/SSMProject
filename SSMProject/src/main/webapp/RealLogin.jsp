<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="assets/css/Reallogin.css">
<!--css파일(reallogin.css)과 연결)-->
<title>Login landing page</title>
<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic&family=Noto+Sans+KR:wght@100..900&family=Noto+Sans:ital,wght@0,100..900;1,100..900&display=swap"
	rel="stylesheet">
</head>
<body>
	<section class="side">
		<div class="left-section">
			<h2 class="text-white">ssm에 로그인하세요</h2>
			<p class="text-white">계정이 없으면 회원가입 후 이용이 가능합니다</p>
		</div>
	</section>

	<section class="main">
		<div class="login-container">
			<form class="login-form" action="Login">
				<div class="form-control">
					<label for="username">아이디</label> <input type="text"
						id="아이디를 입력하세요" placeholder="아이디를 입력하세요" name="id">
				</div>
				<div class="form-control">
					<label for="password">비밀번호</label> <input type="password"
						id="비밀번호를 입력하세요" placeholder="비밀번호를 입력하세요" name="pw">
				</div>
				<script>
				<%String errorMessage = (String) request.getAttribute("errorMessage");
					if (errorMessage != null) {
				%>
						alert("<%=errorMessage%>");
				<%
				}
				%>
					
				</script>

				<div class="button-control">
					<button class="submit">로그인</button>
				</div>
			</form>
		</div>
	</section>
</body>
</html>