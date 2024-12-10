<%@page import="com.SSMProject.model.CommentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SSM Project</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">


<!--  CSS -->
<link rel="stylesheet" href="assets/css/CommunityDetail.css">
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

	<%
	ArrayList<CommentDTO> comment = (ArrayList<CommentDTO>) request.getAttribute("Commentlist");
	%>



	<!-- 메인 -->
	<main class="container my-5 pt-5">
		<section>
			<!-- 회원 정보 -->
			<div class="d-flex align-items-center mb-3">
				<img src="https://via.placeholder.com/50" alt="User Image"
					class="rounded-circle me-3">
				<div>
					<h5 class="mb-0">Ilove_PojangMacha</h5>
					<small class="text-muted">진달동 · 1시간 전</small>
				</div>
			</div>

			<!-- 게시글 -->
			<div class="card mb-3 shadow-sm">
				<div class="card-body">
					<h3 class="card-title">글 제목</h3>
					<img src="images/포장마차1.png" alt="Post Image"
						class="img-fluid rounded mb-3">
					<p>
						씀님들 팥붕vs슈붕? 저는 슈붕파입니다 ㅎㅎ<br>추워서 나가기 싫지만 붕어빵사먹으러 나갔다 왔네요 ㅎㅎ
					</p>
					<div class="d-flex justify-content-between">
						<small class="text-muted">Ilove_PojangMacha님의 게시글 ></small>
						<div>
							<span>💬댓글 <%= comment != null ? comment.size() : 0 %> </span>
						</div>
					</div>
				</div>
			</div>

			<!-- 댓글창 -->
			<div class="comments">
				<h6>댓글</h6>
				<!-- 서블릿에서 검색과정을 다 거친 후 표현 -->
				<%
				if (comment != null) {
					for (int i = 0; i < comment.size(); i++) {
				%>
				<div class="comment d-flex mb-3">
					<img src="images/유저이미지.png" alt="User Image"
						class="rounded-circle me-2">
					<div>
						<h6 class="mb-0">익명</h6>
						<small class="text-muted"><%=comment.get(i).getCmtdt() %></small>
						<p class="mt-1"><%=comment.get(i).getCmtcontent() %></p>
					</div>
				</div>
				<%
				}
				}
				%>
				<%
					String title = request.getParameter("title");
				%>

				<form action="CommunityComment" method="post" id="commentForm">
					<div class="mb-3">
						<textarea name="cmtcomment" class="form-control" id="commentInput"
							rows="2" placeholder="댓글을 입력하세요"></textarea>
						<input type="hidden" name="title" value="<%=title%>">
					</div>
					<button type="submit" class="btn btn-primary">댓글 작성</button>
				</form>
			</div>
		</section>
	</main>

	<!-- 자스 연결 -->
	<script src="../assets/js/CommunityPost.js"></script>
	<!-- JavaScript -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
