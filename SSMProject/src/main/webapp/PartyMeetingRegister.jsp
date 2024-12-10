<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Community Form</title>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Custom Styles for this page -->
    <link rel="stylesheet" href="./assets/css/PartyMeetingRegister.css">
    <!-- Google Fonts Preconnect for faster loading -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic&family=Noto+Sans+KR:wght@100..900&family=Noto+Sans:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
</head>

<body>
<!-- 네비게이션 바 ------------------------------------------------------------------------------------------------------------------------------------>
	<%@include file="Header.jsp" %>
  
    <!-- 메인 컨텐츠 (Main Content) -->
    <main class="container" style="margin-top: 100px;">
        <section class="form-container">
            <!-- Title for the form -->
            <h1 class="text-center">모임 글 작성하기</h1>


            <!-- JSP Form -->
            <form action="PartyMeeting" method="post" enctype="multipart/form-data">
                <!-- 제목 (Title) 입력 필드 -->
                <div class="form-group">
                    <label for="title">제목</label>
                    <input type="text" id="title" name="meetingtitle" placeholder="제목을 입력하세요" class="form-control" required>
                </div>

                <!-- 모임 시간 (Meeting Time) 입력 필드 -->
                <div class="form-group">
                    <label for="time">모임 시간</label>
                    <input type="time" id="time" name="meetingdt" class="form-control" required>
                </div>

                <!-- 모임 인원 (Number of Members) 입력 필드 -->
                <div class="form-group">
                    <label for="members">모임 인원수</label>
                    <input type="number" id="members" name="meetinglimit" placeholder="모임 인원수를 입력하세요" class="form-control" required>
                </div>
                
                   <div class="form-group">
                    <label for="file">파일추가</label>
                    <input type="file" id="fileUpload" name="meetingimg" class="form-control" required>
                </div>

                <!-- 등록하기 (Submit) 버튼 -->
                <button type="submit" class="btn btn-primary mt-3">등록하기</button>
            </form>
        </section>
    </main>

    <!-- 푸터 (Footer) -->
    <footer class="text-center py-4">
        <p>© 2024 Community</p>
    </footer>

    <!-- Bootstrap Bundle with Popper (JavaScript) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>

</html>
