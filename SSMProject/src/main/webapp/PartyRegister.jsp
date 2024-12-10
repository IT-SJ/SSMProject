<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>모임 등록</title>

<!-- Bootstrap core CSS 네비바 -->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
   crossorigin="anonymous">

<!-- css연결 -->
<link href="assets/css/PartyRegister.css" rel="stylesheet">

<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic&family=Noto+Sans+KR:wght@500&family=Noto+Sans:ital,wght@0,100..900;1,100..900&display=swap"
   rel="stylesheet">

<!-- jquery 연결 -->
<script src="assets/js/jquery-3.7.1.min.js"></script>

<!-- 이미지 파일 미리보기 스크립트 -->
<script src="assets/js/PartyRegisterimgPreview.js"></script>
</head>

<body>
   <!--네비게이션 바 -->
   <%@include file="Header.jsp"%>


   <div class="con">
      <form action="PartyJoin" method="post" enctype="multipart/form-data">
         <div class="container">

            <!-- 왼쪽섹션 -->
            <div class="left-section">

               <div class="img-area" id="img-area">
                  <img src="images/cloud-upload-solid-24.png" id="upload-icon">
                  <h3 id="upload-title">Upload Image</h3>
                  <p id="upload-info">
                     Image size must be less than <span>2MB</span>
                  </p>
                  <label for="input-file" id="update-image-label">update
                     image</label>
                  <!--왼쪽 버튼 -->
                  <input type="file" accept="image/jpeg, image/png,image/jpg"
                     onchange="readURL(this)" id="input-file" name="imgFile">
               </div>
            </div>
            <!-- 오른쪽 섹션 -->
            <div class="right-section">

               <h3>모임 등록하기</h3>
               <div class="form-group">
                  <label for="shopname">모임 이름</label> <input type="text"
                     id="Partyname" name="Partyname" placeholder="모임 이름" required>
               </div>

               <div class="form-group">
                  <label for="shopaddress">모임 설명</label> <input type="text"
                     id="Partydesc" name="Partydesc" placeholder="모임 설명" required>
               </div>


               <div class="form-group">
                  <label for="location-selects">지역</label>
                  <div class="location-selects">
                     <select id="city" name="city" onchange="updateDistrict()"
                        required>
                        <option value="view" disabled selected>도/특별시/광역시</option>
                        <option value="서울">서울특별시</option>
                        <option value="부산">부산광역시</option>
                        <option value="광주">광주광역시</option>
                     </select> <select id="district" name="district" required>
                        <option value="view" disabled selected>시/군/구</option>
                     </select>
                  </div>


               </div>
               <button type="submit" id="signup-button" name="joinbtn"
                  value="join">등록하기</button>

            </div>
         </div>
      </form>

   </div>




   <!--네비 바 상세메뉴로 들어가는 부트스트랩 코드 -->
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"></script>

</body>

</html>
