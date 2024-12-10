<%@page import="com.SSMProject.model.CommunityDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SSM Community</title>
<!-- Bootstrap core CSS ---------------------------------------------------------------------------------------------------------------->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link href="assets/css/Community.css" rel="stylesheet">


<!-- 폰트 ------------------------------------------------------------------------------------------------------------------------->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic&family=Noto+Sans+KR:wght@100..900&family=Noto+Sans:ital,wght@0,100..900;1,100..900&display=swap"
	rel="stylesheet">

<script src="assets/js/jquery-3.7.1.min.js"></script>
</head>

<body>

	<!-- 네비게이션 바 ---------------------------------------------------------------------------------------------->
	<%@include file="Header.jsp"%>

	<!-- 메인 ------------------------------------------------------------------------------------------------------------>
	<div class="header-section">
		<h1 class="main-title">우리동네 생활</h1>
		<p class="subtitle">동네 생활을 포스팅 하세요.</p>
	</div>

	<div class="container">

		<!-- 왼쪽 필터 영역 -->
		<div class="filter-container">
			<div class="filter-title">필터</div>
			<div class="filter-section" id="region-section">
				<label> <input type="radio" name="region" value="서울"
					onchange="updateDistricts('서울')"> 서울특별시
				</label> <label> <input type="radio" name="region" value="광주"
					onchange="updateDistricts('광주')"> 광주광역시
				</label> <label> <input type="radio" name="region" value="부산"
					onchange="updateDistricts('부산')"> 부산광역시
				</label>
			</div>
			<div class="filter-section hidden" id="district-section">
				<div id="district-options"></div>
			</div>
		</div>

		<!-- 오른쪽 컨텐츠 영역 -->
		<div class="col-md-9">
			<div class="content-wrapper">
				<div class="button-container">
					<button class="register-btn"
						onclick="location.href='CommunityRegister.jsp'">등록하기</button>
				</div>


				<!-- 동적으로 게시글이 추가될 컨테이너 -->
				<div id="posts-container">
					<div class="post-card">
						<div class="post-content">

							<p align="center">지역을 선택하고 커뮤니티활동을 시작 해보세요!</p>
						</div>
					</div>
				</div>
<!--페이지네이션  -->
				<nav aria-label="Page navigation">
					<ul class="pagination justify-content-center" id="pagination"></ul>
				</nav>
			</div>
		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

	<!-- 필터 스크립트 -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

	<script src="assets/js/Community.js"></script>
</body>

</html>