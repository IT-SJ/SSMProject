<%@page import="com.SSMProject.model.UserDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.SSMProject.model.CommunityDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Page</title>
<link rel="stylesheet" href="assets/css/Mypage.css">
<!-- 부트스트랩 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">
<link rel="stylesheet" href="assets/css/Profile.css">
<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic&family=Noto+Sans+KR:wght@100..900&family=Noto+Sans:ital,wght@0,100..900;1,100..900&display=swap"
	rel="stylesheet">

</head>

<body>
	<!-- 네비게이션 바 ------------------------------------------------------------------------------------------------------------------------------------>
	<%@include file="Header.jsp"%>
	
	<!-- 회원 정보 -->
	<section class="user-info my-5">
		<div class="container text-center">
			<div class="profile">
				<div class="profile-picture">
				<img src="${result.profile_img}">
				</div>
				<h2>${result.id}</h2>
				<div class="buttons">
					<form action="FavoriteSelect" style="display: inline-block;">
						<button class="btn1 " type="submit">즐겨찾는
							포장마차</button>
					</form>
					<button class="btn2 "
						onclick="location.href='ProfileUpdate.jsp'">회원정보 수정</button>

				</div>
			</div>
		</div>
	</section>
	<script>
	
	<%String successmsg = (String) request.getAttribute("successmsg");
if (successmsg != null) {%>
	alert("<%=successmsg%>
		");
	<%}%>		
	</script>

<!-- 게시글 표현을 위한 스크립트 태그  -->
<%
	ArrayList<CommunityDTO> posts = (ArrayList<CommunityDTO>) request.getAttribute("UserCommunityList");
%>



	<!-- 최근 글 -->
	<!-- 최근 내가 쓴 글 섹션 -->
	<section class="recent-posts">
		<!-- 전체 콘텐츠를 담는 컨테이너 -->
		<div class="container">
			<!-- 제목과 게시글 수를 표시 -->
			<h3 class="text-center">
				최근 내가 쓴 글 <%= posts != null ? posts.size() : 0 %></span>
			</h3>
			<!-- 게시글들을 그리드 형식으로 나열 -->
			<div class="row mt-4">
			<% if (posts != null && posts.size() > 0) { %>
                <% for (CommunityDTO post : posts) { %>
				<!-- 첫 번째 게시글 -->
				<div class="col-md-4 mb-4">
					<div class="post card">
						<!-- 썸네일을 위한 공간 -->
						<div class="post-thumbnail">
							<img src="<%=post.getCfile()%>">
						</div>
						<div class="post-content card-body">
							<!-- 게시글 제목 -->
							<h4 class="card-title"><%= post.getTitle() %></h4>
							<!-- 게시글 본문 -->
							<p class="card-text"><%= post.getContent() %></p>
						</div>
					</div>
				</div>
				<% } %>
            <% } else { %>
                <p>작성된 글이 없습니다.</p>
            <% } %>

				
			</div>
		</div>
	</section>




	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>