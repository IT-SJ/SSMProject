<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모임 페이지</title>  
     <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <!-- Custom Styles for this page -->
 <link rel="stylesheet" href="assets/css/PartyDetail.css ">
    <!-- Google Fonts Preconnect for faster loading -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic&family=Noto+Sans+KR:wght@100..900&family=Noto+Sans:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    

</head>

<body>

	<%@include file="Header.jsp"%>

	<div class="container">
    <header class="header">
        <h1 class="main-title">모임</h1>
    </header>

    <div class="content">
        <!-- 왼쪽 섹션 -->
        <div class="left-panel">
            <div class="profile">
                <div class="profile-image-group">
                    <div class="profile-image"></div>
                </div>
                <p class="group-title">모임 이름</p>
                <p class="group-description">모임 설명<br>우리 모임은 어쩌고 저쩌고~</p>
                <button class="write-button">모임 글 작성하기</button>
            </div>
        </div>

        <!-- 오른쪽 섹션 -->
        <div class="right-panel">
            <h3 class="section-title">앨범</h3>
            <div class="album-container">
                <div class="album">
                    <div class="album-item-group">
                        <div class="album-item"></div>
                        <div class="album-item"></div>
                        <div class="album-item"></div>
                        <div class="album-item"></div>
                    </div>
                </div>
            </div>
            <div class="pagination">
                <button class="page-button active" data-page="1">1</button>
                <button class="page-button" data-page="2">2</button>
            </div>

            <h3 class="section-title">모임 멤버</h3>
            <div class="members">
                <div class="member-group">
                    <div class="member">
                        <div class="member-circle"></div>
                        <p class="member-description">멤버 1</p>
                    </div>
                    <div class="member">
                        <div class="member-circle"></div>
                        <p class="member-description">멤버 2</p>
                    </div>
                    <div class="member">
                        <div class="member-circle"></div>
                        <p class="member-description">멤버 3</p>
                    </div>
                    <div class="member">
                        <div class="member-circle"></div>
                        <p class="member-description">멤버 4</p>
                    </div>
                </div>
            </div>

            <h3 class="section-title">일정</h3>
            <div class="schedule">
                <div class="schedule-item-group">
                    <div class="schedule-item">
                        <div class="date-box">
                            <span class="month">11월</span>
                            <span class="date">13</span>
                        </div>
                        <div class="schedule-info">
                            <p class="schedule-text">모임에만 공개된 일정이에요.</p>
                            <p class="schedule-status">종료</p>
                            <p class="schedule-time">오후1:00 인원: 6/6명</p>
                        </div>
                    </div>
                    <div class="schedule-item">
                        <div class="date-box">
                            <span class="month">11월</span>
                            <span class="date">13</span>
                        </div>
                        <div class="schedule-info">
                            <p class="schedule-text">모임에만 공개된 일정이에요.</p>
                            <p class="schedule-status">종료</p>
                            <p class="schedule-time">오후1:00 인원: 6/6명</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

</script>
</html>