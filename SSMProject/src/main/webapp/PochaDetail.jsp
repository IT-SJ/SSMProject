<%@page import="com.SSMProject.model.PochaDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SSM글쓰기</title>
<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link href="assets/css/PochaDetail.css" rel="stylesheet">
<link href="assets/css/Star.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic&family=Noto+Sans+KR:wght@100..900&family=Noto+Sans:ital,wght@0,100..900;1,100..900&display=swap"
	rel="stylesheet">

</head>

<body>

	<!-- 네비게이션 바 ------------------------------------------------------------------------------------------------------------------------------------>
	<%@include file="Header.jsp"%>

	<!-- 바디 메인 ----------------------------------------------------------------------------------------------------------------------->
	<%
		PochaDTO pocharesult = (PochaDTO)request.getAttribute("PochaInfo");
	%>
	<div class="container">
		<!-- 상단 제목 -->
		<h1 class="title"><%=pocharesult.getPocha_name()%></h1>

		<!-- 사진 영역 -->
		<div class="photo-box">
			<img src="<%=pocharesult.getUploadPath()%>">
		</div>
		
		<!-- 리뷰 정보 -->
		<div class="review-section">
			<h5 class="review-title">별점</h5>
		<div class="star-rating">
  			<span class="star" data-value="1">★</span>
  			<span class="star" data-value="2">★</span>
  			<span class="star" data-value="3">★</span>
  			<span class="star" data-value="4">★</span>
  			<span class="star" data-value="5">★</span>
  			<span class="rating-value">0 </span>
  			
		</div>

		
			<!-- 가게 정보 -->
			<h5 class="review-title">가게 정보</h5>
			<ul class="store-info">
				<li>가게이름: <%=pocharesult.getPocha_name() %></li>
				<li>가게주소: <%=pocharesult.getPocha_addr() %></li>
				<li>연락처: <%=pocharesult.getPocha_tel() %></li>
				<li>운영 요일: <%=pocharesult.getDayList() %></li>
			</ul>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>


	<!-- 별 자스 연결 -->
	<script src="assets/js/star.js"></script>
</body>

</html>