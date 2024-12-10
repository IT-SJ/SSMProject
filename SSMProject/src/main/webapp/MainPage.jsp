<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.SSMProject.model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="generator" content="Hugo 0.84.0">
<title>SSM</title>

<!-- 부트스트랩 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!-- 파비콘 -->
<link rel="apple-touch-icon"
	href="/docs/5.0/assets/img/favicons/apple-touch-icon.png"
	sizes="180x180">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-32x32.png"
	sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-16x16.png"
	sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.0/assets/img/favicons/manifest.json">
<link rel="mask-icon"
	href="/docs/5.0/assets/img/favicons/safari-pinned-tab.svg"
	color="#7952b3">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon.ico">


<!-- css연결 -->
<link href="assets/css/mainpage.css" rel="stylesheet">
<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic&family=Noto+Sans+KR:wght@100..900&family=Noto+Sans:ital,wght@0,100..900;1,100..900&display=swap"
	rel="stylesheet">

</head>


<body>

	<!-- 네비게이션 바 ------------------------------------------------------------------------------------------------------------------------------------>
	<%@include file="Header.jsp"%>

	<!-- 사장님 포차정보 업데이트 시 나오는 알람 -->
	<script>
	<%
	String mesg = (String) request.getAttribute("successmsg");
	if (mesg != null) {%>
		alert("<%=mesg%>")
	<%
	}
	%>
	</script>
	
	<!-- 메인 -->
	<main>
		<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="carousel-bg"></div>
					<!-- 배경 색을 채운 div-->
					<div class="container">
						<div class="carousel-caption text-start">
							<h1>SSM 어서와 우리 동네 !</h1>
							<p>어디서도 만나볼 수 없었던 프리미엄 동네 커뮤니티</p>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="carousel-bg"></div>
					<!-- 배경 색을 채운 div -->
					<div class="container">
						<div class="carousel-caption">
							<h1>SSM에 오신것을 환영합니다.</h1>
							<p>SweetStreetMeet에서 동네 이웃을 만나보세요~!</p>
							<p>
								<%
								// 로그인하지 않았을때 
								if (result == null) {
								%>
								<a class="btn btn-lg btn-primary" href="Join.jsp">회원가입</a>
							</p>
							<%
							}
							%>

						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="carousel-bg"></div>
					<!-- 배경 색을 채운 div-->
					<div class="container">
						<div class="carousel-caption text-end">
							<h1>동네 포장마차를 찾아보세요!</h1>
							<p>SSM으로 근처 포장마차를 찾고 겨울철 간식을 즐겨보세요~!</p>
						</div>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#myCarousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#myCarousel" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>


		<!-- Marketing messaging and featurettes
  ================================================== -->
		<!-- Wrap the rest of the page in another container to center all the content. -->

		<div class="container marketing">

			<!-- 캐러셀밑에 6개동그라미 -->



			<!-- 붕어빵 -->
			<div class="row">
				<div class="col-lg-4">
					<!-- rounded-cirle 이미지 circle화 -->
					<svg class="bd-placeholder-img rounded-circle" width="140"
						height="140" xmlns="http://www.w3.org/2000/svg" role="img"
						aria-label="Placeholder: 140x140"
						preserveAspectRatio="xMidYMid slice" focusable="false">
            <!-- preserveAspectRatio : SVG의 내용이 어떻게 크기를 조정할지 설정하는 속성-->
            <title>붕어빵</title> <!-- 이미지에 마우스 올려대면 붕어빵이라고 뜸 -->
            <image href="images/붕어빵11.PNG" width="140" height="140"
							preserveAspectRatio="xMidYMid slice" />
          </svg>
					<p></p>
					</p>
					<p>
						<a class="btn btn-secondary" href="PochaSelectAll?menu=붕어빵">붕어빵
							&raquo;</a>
					</p>
					<!-- 클릭버튼 붕어빵 -->

					<!-- 타코야키-->
				</div>
				<!-- /.col-lg-4 -->
				<div class="col-lg-4">
					<svg class="bd-placeholder-img rounded-circle" width="140"
						height="140" xmlns="http://www.w3.org/2000/svg" role="img"
						aria-label="Placeholder: 140x140"
						preserveAspectRatio="xMidYMid slice" focusable="false">
            <title>타코야키</title>
            
            <image href="images/타코야키21.PNG" width="140" height="140"
							preserveAspectRatio="xMidYMid slice" />
          </svg>
					<p></p>
					<p>
						<a class="btn btn-secondary" href="PochaSelectAll?menu=타코야키">타코야키
							&raquo;</a>
					</p>



					<!-- 떡볶이-->
				</div>
				<!-- /.col-lg-4 -->
				<div class="col-lg-4">
					<svg class="bd-placeholder-img rounded-circle" width="140"
						height="140" xmlns="http://www.w3.org/2000/svg" role="img"
						aria-label="Placeholder: 140x140"
						preserveAspectRatio="xMidYMid slice" focusable="false">
            <title>떡볶이</title>
            
            <image href="images/떡볶이.PNG" width="140" height="140"
							preserveAspectRatio="xMidYMid slice" />
          </svg>
					<p></p>
					<p>
						<a class="btn btn-secondary" href="PochaSelectAll?menu=떡볶이">떡볶이
							&raquo;</a>
					</p>



				</div>
				<!-- 어묵 -->
				<div class="col-lg-4">
					<svg class="bd-placeholder-img rounded-circle" width="140"
						height="140" xmlns="http://www.w3.org/2000/svg" role="img"
						aria-label="Placeholder: 140x140"
						preserveAspectRatio="xMidYMid slice" focusable="false">
            <title>어묵</title>
            <image href="images/오뎅사진 222.PNG" width="140" height="140"
							preserveAspectRatio="xMidYMid slice" />
          </svg>
					<P></P>
					<p>
						<a class="btn btn-secondary" href="PochaSelectAll?menu=어묵">어묵
							&raquo;</a>
					</p>




				</div>
				<!-- 닭꼬치 -->
				<div class="col-lg-4">
					<svg class="bd-placeholder-img rounded-circle" width="140"
						height="140" xmlns="http://www.w3.org/2000/svg" role="img"
						aria-label="Placeholder: 140x140"
						preserveAspectRatio="xMidYMid slice" focusable="false">
            <title>닭꼬치</title>
            <image href="images/닭꼬치.PNG" width="140" height="140"
							preserveAspectRatio="xMidYMid slice" />
          </svg>
					<P></P>
					<p>
						<a class="btn btn-secondary" href="PochaSelectAll?menu=닭꼬치">닭꼬치
							&raquo;</a>
					</p>





				</div>
				<!-- 호떡 -->
				<div class="col-lg-4">
					<svg class="bd-placeholder-img rounded-circle" width="140"
						height="140" xmlns="http://www.w3.org/2000/svg" role="img"
						aria-label="Placeholder: 140x140"
						preserveAspectRatio="xMidYMid slice" focusable="false">
            <title>호떡</title>
            <image href="images/호떡사진.PNG" width="140" height="140"
							preserveAspectRatio="xMidYMid slice" />
          </svg>
					<P></P>
					<p>
						<a class="btn btn-secondary" href="PochaSelectAll?menu=호떡">호떡
							&raquo;</a>
					</p>



				</div>
			</div>
		</div>

		<!-- FOOTER -->
		<footer class="container">
			<p class="float-end">
				<a href="#">Back to top</a>
			</p>
			<p>
				&copy; SSM Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a
					href="#">Terms</a>
			</p>
		</footer>
	</main>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>


</body>

</html>