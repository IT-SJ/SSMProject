<%@page import="com.SSMProject.model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Party</title>
<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link href="assets/css/Party.css" rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic&family=Noto+Sans+KR:wght@100..900&family=Noto+Sans:ital,wght@0,100..900;1,100..900&display=swap"
	rel="stylesheet">
<script src="assets/js/jquery-3.7.1.min.js"></script>
</head>

<body>

	<header>
		<!-- 네비게이션 바 -->
		<%@include file="Header.jsp"%>
	</header>
	<!-- 메인 ------------------------------------------------------------------------------------------------------------>
	<div class="header-section">
		<h1 class="main-title">모임</h1>
		<p class="subtitle">원하는 동네에서 모임을 만들고 즐겨보세요.</p>
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
						onclick="location.href='PartyRegister.jsp'">등록하기</button>
				</div>

				<!-- 게시글 카드 -->
				<div id="posts-container">
					<!-- 게시글이 동적으로 여기에 추가됩니다. -->
					<div class="post-card">
						<div class="post-content">

							<p align="center">모임 지역을 고르고 모임을 구경하세요!</p>
						</div>
					</div>
				</div>

				<!-- 페이지 네이션 -->
				<nav aria-label="Page navigation">
					<ul class="pagination justify-content-center" id="pagination">
					</ul>
				</nav>

			</div>
		</div>
	</div>
	<script>
			<%String mesg = (String) request.getAttribute("successmsg");
if (mesg != null) {%>
    			alert("<%=mesg%>
				");
			<%}%>
				
			</script>

	<!-- 필터 스크립트 -->
	<scripts
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js">
	</script> <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script> <script src="assets/js/party.js"></script>
</body>

</html>

