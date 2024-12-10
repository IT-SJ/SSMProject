<%@page import="com.SSMProject.model.PochaDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>사장님 가게 수정</title>
<link href="assets/css/CeoShopUpdate.css" rel="stylesheet">

<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic&family=Noto+Sans+KR:wght@100..900&family=Noto+Sans:ital,wght@0,100..900;1,100..900&display=swap"
	rel="stylesheet">

<!-- 주소 검색 관련 script 연결 -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c91165c9953b9cc6cf72410d15027a72&libraries=services"></script>
<script src="assets/js/addressPostcode.js"></script>
</head>	

<body>
	<!-- 네비게이션 바 -->
	<jsp:include page="Header.jsp" />
	
	
	<%
		PochaDTO selectresult = (PochaDTO)session.getAttribute("PochaSelectOne");
	
	%>
	<form action="CeoShopUpdate" method="post"
		enctype="multipart/form-data">
		<div class="modify-container">
			<h1 class="title">사장님 가게 수정</h1>
			<div class="profile-section">
				<img class="profile-img" src="<%=selectresult.getUploadPath() %>" alt="프로필 사진"
					id="profilePreview">
				<button type="button" id="changePhotoBtn" class="change-photo-btn">사진변경</button>
				<input type="file" id="fileUpload" style="display: none;"
					name="shopfile" accept="image/*">
			</div>
		</div>0

		<div class="unified-form-container">
			<div class="form-group">
				<label for="address">가게주소</label>
				<input type="text" id="address"
					name="pocha_addr" placeholder="가게주소를 입력해주세요">
				<div id="map"></div>
				<input type="button" id="search_address"
					onclick="addressPostcode()" value="주소 검색">
				<!-- 위도 -->
				<input type="text" id="latitude" name="lat" style="display: none">
				<!-- 경도 -->
				<input type="text" id="longitude" name="lon" style="display: none">

			</div>
			<div class="form-group">
				<label>운영 요일</label>
				<div class="radio-group">
					<div class="radio-item">
						<input type="checkbox" id="mon" name="days" value="월"> <label
							for="mon">월</label>
					</div>
					<div class="radio-item">
						<input type="checkbox" id="tue" name="days" value="화"> <label
							for="tue">화</label>
					</div>
					<div class="radio-item">
						<input type="checkbox" id="wed" name="days" value="수"> <label
							for="wed">수</label>
					</div>
					<div class="radio-item">
						<input type="checkbox" id="thu" name="days" value="목"> <label
							for="thu">목</label>
					</div>
					<div class="radio-item">
						<input type="checkbox" id="fri" name="days" value="금"> <label
							for="fri">금</label>
					</div>
					<div class="radio-item">
						<input type="checkbox" id="sat" name="days" value="토"> <label
							for="sat">토</label>
					</div>
					<div class="radio-item">
						<input type="checkbox" id="sun" name="days" value="일"> <label
							for="sun">일</label>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label for="shopoper">운영 시간</label>
				<div class="time-input-container">
					<input type="time" id="shopoper-start" name="shopoper_start"
						required> <span>~</span> <input type="time"
						id="shopoper-end" name="shopoper_end" required>
				</div>
			</div>
			<button type="submit" class="password-btn">수정 완료</button>
		</div>
	</form>

	<!-- 부트스트랩 JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
		
	</script>

	<!-- 미리보기 JS -->
	<script src="assets/js/CeoShopUpdatePreview.js"></script>
</body>

</html>
