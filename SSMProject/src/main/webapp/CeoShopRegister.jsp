	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>사장님 등록</title>

<!-- Bootstrap core CSS 네비바 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<!-- css연결 -->
<link href="assets/css/CeoShopRegister.css" rel="stylesheet">
<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic&family=Noto+Sans+KR:wght@100..900&family=Noto+Sans:ital,wght@0,100..900;1,100..900&display=swap"
	rel="stylesheet">

<!-- jquery 연결 -->
<script src="assets/js/jquery-3.7.1.min.js"></script>
<script></script>

<!-- 주소 검색 관련 script 연결 -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c91165c9953b9cc6cf72410d15027a72&libraries=services"></script>
	<script src="assets/js/addressPostcode.js"></script>

<script src="assets/js/addressPostcode.js"></script>
<!-- 이미지 파일 미리보기 스크립트 -->
<script src="assets/js/Preview.js"></script>

</head>

<body>
	<!-- 네비게이션 바 -->
	<%@include file="Header.jsp"%>

	<form action="CeoRegister" method="post" enctype="multipart/form-data">
		<div class="con">
			<div class="container">
				<!-- 왼쪽섹션 -->
				<div class="left-section">
					<div class="img-area" id="img-area">
						<img src="images/cloud-upload-solid-24.png" id="upload-icon">
						<h3 id="upload-title">Upload Image</h3>
						<p id="upload-info">
							Image size must be less than <span>2MB</span>
						</p>
					</div>
					<input type="file" id="select-button" style="display: none"
						onchange="readURL(this)" name="shopimage" /> <label
						class="select-image" for="select-button" id="select-image">사진 추가</label>
				</div>


				<!-- 오른쪽 섹션 -->
				<div class="right-section">

					<h3>사장님 가게 등록</h3>
					<div class="form-group">
						<label for="shopname">가게 이름</label> <input type="text"
							id="shopname" name="shopname" placeholder="가게이름을 입력해주세요">
					</div>
					<div class="form-group">
						<label for="shopmenu">메뉴</label> <select id="shopmenu"
							name="shopmenu">
							<option value="" disabled selected>메뉴를 선택해주세요</option>
							<option value="붕어빵">붕어빵</option>
							<option value="어묵">어묵</option>
							<option value="떡볶이">떡볶이</option>
							<option value="순대">순대</option>
							<option value="닭꼬치">닭꼬치</option>
							<option value="기타">기타</option>
						</select>
					</div>

					<div class="form-group">
						<label for="shopaddress">가게주소</label> <input type="text"
							id="address" name="shopaddress" placeholder="가게주소를 입력해주세요">
						<div id="map"></div>
						<input type="button" id="search_address "
							onclick="addressPostcode()" value="주소 검색">
						<!-- 위도 -->
						<input type="text" id="latitude" name="shoplatitude"
							style="display: none">
						<!--  경도 -->
						<input type="text" id="longitude" name="shoplongitude"
							style="display: none">

					</div>

					<div class="form-group">
						<label for="shopphone">연락처</label>
						<div class="input-wrapper">
							<input type="text" id="shopphone" name="shoptel"
								placeholder="-없이 입력하세요">
						</div>
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
							<input type="time" id="shopoper-start" name="shopoper-start"
								required> <span>~</span> <input type="time"
								id="shopoper-end" name="shopoper-end" required>
						</div>
					</div>

					<script>
            document.addEventListener("DOMContentLoaded", () => {
              const startTimeInput = document.querySelector("#shopoper-start");
              const endTimeInput = document.querySelector("#shopoper-end");
          
              function validateTimes() {
                const startTime = startTimeInput.value;
                const endTime = endTimeInput.value;
          
                if (startTime && endTime && startTime >= endTime) {
                  alert("운영 종료 시간은 시작 시간보다 커야 합니다!");
                  endTimeInput.value = ""; // 잘못된 입력 초기화
                }
              }
          
              startTimeInput.addEventListener("change", validateTimes);
              endTimeInput.addEventListener("change", validateTimes);
            });
          </script>

					<button type="submit" id="signup-button" name="joinbtn">등록하기</button>
				</div>
			</div>
		</div>
	</form>
<!--  승현 PUSH 용 -->

</body>

</html>