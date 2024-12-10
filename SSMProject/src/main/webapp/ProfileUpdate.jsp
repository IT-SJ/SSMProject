<%@page import="com.SSMProject.model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원정보 수정</title>
<link href="assets/css/ProfileUpdate.css" rel="stylesheet">

<!-- Bootstrap core CSS 네비바 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic&family=Noto+Sans+KR:wght@100..900&family=Noto+Sans:ital,wght@0,100..900;1,100..900&display=swap"
	rel="stylesheet">
</head>


<body>
	<!--네비게이션 바 -->
	<%@include file="Header.jsp"%>

	<div class="modify-container">
		<h1 class="title">회원정보 수정</h1>
		<form class="edit-form" action="UserInfoUpdate" method="post"
			enctype="multipart/form-data">
			<div class="profile-section">
				<img class="profile-img" id="imagePreview"
					src="<%=result.getProfile_img()%>" alt="프로필 사진">
				<!-- 프로필 사진-->
				<!-- <span class="user-id"></span> -->
				<!-- 닉네임 -->
				<label for="fileUpload"
					style="display: inline-block; padding: 10px 20px; background-color: #3d2b1f; color: white; text-align: center; border-radius: 5px; cursor: pointer;">
					사진 변경 </label> <input type="file" class="files" id="fileUpload" style="display: none;"
					name="imgFile" accept="image/*" />
				<!-- 사진 변경 버튼 -->
			</div>
			
			<div class="form-group">
			
				<label for="location-selects">지역</label>
				<div class="location-selects">
					<select id="city" name="city" required>
						<option value="view">도/특별시/광역시</option>
						<option value="seoul">서울특별시</option>
						<option value="busan">부산광역시</option>
						<option value="gwangju">광주광역시</option>
					</select> <select id="district" name="district"
						onchange="categoryChange(this)" required>
						<option value="view">시/군/구</option>
						<option value="east">동구</option>
						<option value="west">서구</option>
						<option value="south">남구</option>
						<option value="north">북구</option>
						<option value="gwangsan">광산구</option>
					</select>
				</div>

			</div>

			<div class="form-group">
				<label>현재 비밀번호</label> <input type="password" id="currentPassword"
					class="form-input" value="<%=result.getPw()%>" disabled>
			</div>

			<div class="form-group">
				<label>새로운 비밀번호</label> <input type="password" class="form-input"
					id="newPassword" name="newPassword" placeholder="새로운 비밀번호를 입력해주세요"
					required>
			</div>

			<div class="form-group">
				<label>새로운 비밀번호 확인</label> <input type="password" class="form-input"
					id="confirmPassword" placeholder="새로운 비밀번호를 다시 입력해주세요" required>
				<span id="passwordError" class="error"></span>
			</div>


			<button type="submit" class="password-btn">회원 정보 수정 완료</button>
		</form>
	</div>
	<!--네비 바 상세메뉴로 들어가는 부트스트랩 코드 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

	<!-- 미리보기 스크립트 -->
	<script src="assets/js/ProfileUpdateImgPreview.js"></script>
</body>
</html>