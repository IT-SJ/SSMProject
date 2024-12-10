<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SSM 글쓰기</title>
    <link href="./assets/css/Posting.css" rel="stylesheet">
    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="../assets/css/Posting.css">
    <!-- 글꼴 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic&family=Noto+Sans+KR:wght@100..900&family=Noto+Sans:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
</head>

<body>
<!-- 네비게이션 바 ------------------------------------------------------------------------------------------------------------------------------------>
   <%@include file="Header.jsp" %>
       
    <div class="container mt-5">
        <!-- 글쓰기 영역 -->
        <div class="row justify-content-center mt-5">
            <div class="col-12 col-md-8 col-lg-6">
                <h2 class="text-center">게시판 글쓰기</h2>

                <!-- JSP Form -->
                <form action="CommunityRegister" method="post" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="title" class="form-label">Title</label>
                        <input type="text" class="form-control" id="title" placeholder="제목을 입력하세요" name="title" required>
                    </div>
                    <div class="mb-3">
                        <label for="detail" class="form-label">Content</label>
                        <textarea class="form-control" id="detail" rows="10" placeholder="내용을 입력하세요" name="content" required></textarea>
                    </div>
                    <div class="mb-3">
                      <label for="file" class="form-label">Image UPload</label>
                        <input type="file" id="fileUpload" name="cfile" class="form-control">
                        
                        </div>
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
                    <div class="d-flex justify-content-between">
                        <button type="submit" class="btn btn-primary">등록</button>
                        <button type="reset" class="btn btn-secondary">취소</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" 
        crossorigin="anonymous"></script>
</body>

</html>