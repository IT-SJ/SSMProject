<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SSM 회원가입</title>

<!-- css연결 -->
<link href="assets/css/Join.css" rel="stylesheet">
<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic&family=Noto+Sans+KR:wght@500&family=Noto+Sans:ital,wght@0,100..900;1,100..900&display=swap"
	rel="stylesheet">

<!-- jquery 연결 -->
<script src="assets/js/jquery-3.7.1.min.js"></script>


</head>

<body>
  <div class="container">
    <div class="left-section">
      <h1>SSM에 가입하세요</h1>
      <p>개인 계정을 만들고 커뮤니티에 참여하세요</p>
    </div>
    <div class="right-section">
      <form action="Join" id="signup-form" method="post">

        <div class="form-group">
          <label for="userid">아이디</label>
          <input type="text" id="userid" name="id" placeholder="id를 입력하세요" required>
        </div>

        <div class="form-group">
          <label for="password">비밀번호</label>
          <input type="password" id="password" name="pw" placeholder="비밀번호를 입력하세요" required>
        </div>

        <div class="form-group">
          <label for="password">비밀번호 확인</label>
          <div class="input-wrapper">
            <input type="password" id="checkpw" placeholder="비밀번호를 확인하세요" required>
            <span class="check-icon">✓</span>
            <span class="x-icon">X</span>
          </div>
        </div>

        <div class="form-group">
          <label for="email">이메일</label>
          <input type="text" id="email" name="email" placeholder="이메일을 입력하세요" required>
        </div>

        <div class="form-group">
          <label for="location-selects">지역</label>
          <div class="location-selects">
            <select id="city" name="city" onchange="updateDistrict()" required>
              <option value="view" disabled selected>도/특별시/광역시</option>
              <option value="서울">서울특별시</option>
              <option value="부산">부산광역시</option>
              <option value="광주">광주광역시</option>
            </select>
          
            <select id="district" name="district" required>
              <option value="view" disabled selected>시/군/구</option>
            </select>
          </div>
          

        </div>
        <div class="form-group">
          <label>가입자 구분</label>
          <div class="radio-group">
            <input type="radio" id="personal" name="userType" value="personal" required>
            <label for="personal">개인</label>
            <input type="radio" id="business" name="userType" value="business">
            <label for="business">사업자</label>
          </div>
        </div>
		
        <button type="submit" id="signup-button" name="joinbtn" value="join" disabled>회원가입</button>
				<script src="assets/js/Join.js"></script>
				<script>
				<%String result = (String) request.getAttribute("successmsg");
				if (result != null) {%>
    			alert("<%=result%>");
					location.href = "RealLogin.jsp";
				<%}%>
				</script>
			</form>
		</div>
	</div>


</body>

</html>