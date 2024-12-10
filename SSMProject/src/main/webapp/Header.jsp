<%@page import="com.SSMProject.model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.bg-light {
  background-color: #ecdbc8 !important; /* 연한 분홍색 */
}
</style>
</head>
<body>

	<!-- 네비게이션 바 ------------------------------------------------------------------------------------------------------------------------------------>
	<header>
		<%
		UserDTO result = (UserDTO) session.getAttribute("result");
		%>

		<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
			<div class="container-fluid">
				<a class="navbar-brand" href="MainPage.jsp">SSM</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarScroll"
					aria-controls="navbarScroll" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarScroll">
					<ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll"
						style="--bs-scroll-height: 100px;">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="Community.jsp"
							id="navbarScrollingDropdown" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> 커뮤니티 </a>
							<ul class="dropdown-menu"
								aria-labelledby="navbarScrollingDropdown">
								<li><a class="dropdown-item" href="Party.jsp">모임</a></li>
								<li><a class="dropdown-item" href="Community.jsp">게시판</a></li>
							</ul></li>
						<li class="nav-item">
              			<a class="nav-link" href="Find.jsp">포장마차</a>
            			</li>


						<%
						if (result != null) {

							if (result.getUserType().equals("business")) {
						%>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarScrollingDropdown" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> 사장님</a>
							<ul class="dropdown-menu"	
								aria-labelledby="navbarScrollingDropdown">
								<li><a class="dropdown-item" href="CeoShopRegister.jsp">등록</a></li>
								<li><a class="dropdown-item" href="PochaSelectOne">수정</a></li>
							</ul></li>
						<%
						}
						}
						%>
						<!--로그인 성공시 마이페이지가 뜬다! -->
						<% if(result != null) { %>
						<li class="nav-item"><a class="nav-link" href="MyPageSelect">마이페이지</a></li>
						<!-- 로그인 실패 시 마이페이지가 안뜬다 ! -->
						<%}else { %>
							
						<%} %>
					</ul>

					<%
					// 로그인에 성공 했다면 로그인 버튼
					if (result != null) {
					%>
					<a class="btn btn-light" type="submit" href="Logout" style ="border-radius:8px ;">로그아웃</a>

					<%
					// 로그인에 실패 했다면 로그아웃 버튼
					} else {
					%>
					<a class="btn btn-light" type="submit" href="RealLogin.jsp">로그인</a>
					<%
					}
					%>
				</div>
			</div>
		</nav>

	</header>
</body>
</html>