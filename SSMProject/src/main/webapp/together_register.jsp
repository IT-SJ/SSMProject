<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>SSM 회원가입</title>

  <!-- Bootstrap core CSS 네비바 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
  integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

  <!-- css연결 -->
  <link href="assets/css/insukcss/together_register.css" rel="stylesheet">

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
  <!--네비게이션 바 -->
  <header>
   	<%@include file="Header.jsp" %>
</header>
<!--네비바 여기까지 -->
  <div class="con">
    <div class="container">
      <!-- 왼쪽섹션 -->
      <div class="left-section">
        <div class="img-area">
          <img src="../../images/cloud-upload-solid-24.png">
          <h3>Upload Image</h3>
          <p>Image size must be less than <span>2MB</span> </p>
          <label for="input-file">update image</label> <!--왼쪽 버튼 -->
          <input type="file" accept="image/jpeg, image/png,image/jpg" id="input-file" >
        </div>
      </div>
       <!-- 오른쪽 섹션 -->
       <div class="right-section">
        <form action="PartyModify" method="post">
          <h3>모임 등록하기</h3>
          <div class="form-group">
            <label for="shopname">모임 이름</label>
            <input type="text" id="shopname" name="party_name" placeholder="모임 이름" required>
          </div>

          <div class="form-group">
            <label for="shopaddress">모임 설명</label>
            <input type="text" id="password" name="party_desc" placeholder="모임 설명" required>
          </div>

          <div class="form-group">
            <label for="shopphone">대표 이미지 등록</label>
            <div class="input-wrapper">
              <input type="text" id="shopphone" name="party_img" placeholder="이미지를 등록하세요" required>
            </div>
          </div>
            <label for="region">모임 지역</label>
          <div class="location-selects">

            <select id="city" name="city" onchange="updateDistrict()" required>
              <option value="view" disabled selected>도/특별시/광역시</option>
              <option value="서울">서울특별시</option>
              <option value="부산">부산광역시</option>
              <option value="광주">광주광역시</option>
            </select>
            <select id="district" name="district" required>
              <option value="view" disabled selected>시/군/구</option>
              <option value="남구">남구</option>
              <option value="동구">동구</option>
              <option value="서구">서구</option>
              <option value="광산구">광산구</option>
              <option value="북구">북구</option>
            </select>
            </div>
         
          <button type="submit" id="signup-button" name="joinbtn" value="join" disabled>등록하기</button>
          
              <!--네비 바 상세메뉴로 들어가는 부트스트랩 코드 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>
<script src="/SSMProject/src/main/webapp/assets/js/Join.js"></script>
</body>

</html>
    