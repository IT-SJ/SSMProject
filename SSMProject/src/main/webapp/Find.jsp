<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.SSMProject.model.PochaDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>	
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>포장마차 찾기</title>

<!-- 글꼴 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic&family=Noto+Sans+KR:wght@100..900&family=Noto+Sans:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <!-- Bootstrap core CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
  integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<!-- css연결 코드 -->
<link href="assets/css/Find.css" rel="stylesheet">
<!-- js연결 -->
<script src="assets/js/Find.js"></script>
</head>
<body>
   

	<!-- 네비게이션 바 ------------------------------------------------------------------------------------------------------------------------------------>
    <%@include file="Header.jsp" %>
<%

ArrayList<PochaDTO> pochaList = (ArrayList<PochaDTO>) request.getAttribute("pochalist");
PochaDTO firstPocha = (pochaList != null && pochaList.size() > 0) ? pochaList.get(0) : null;
 
    %>
    <main>
      <!-- 메인시작--------------------------------------------------------- -->
      <div class="container">
       
        <h1>포장마차 찾기</h1>
        <p>동네에서 가장 맛있는 포장마차를 찾아보세요</p>
      
        <div class="search-container">
          <div class="form-group">
          <form action="Find" method="post">
            <div class="location-selects" >
              <label for="">지역</label>
              <select id="city" name="city" onchange="updateDistrict()" required>
                <option value="view" disabled selected>도/특별시/광역시</option>
                <option value="서울">서울특별시</option>
                <option value="부산">부산광역시</option>
                <option value="광주">광주광역시</option>
              </select>
            
              <select id="district" name="district" required>
                <option value="view" disabled selected>시/군/구</option>
              </select>
                <label for="">메뉴</label>
                    <select id="menu" name="menu" required>
                        <option disabled selected>메뉴를 선택하세요</option>
                        <option value="붕어빵">붕어빵</option>
                        <option value="떡볶이">떡볶이</option>
                        <option value="어묵">어묵</option>
                        <option value="호떡">호떡</option>
                        <option value="타코야키">타코야키</option>
                        <option value="닭꼬치">닭꼬치</option>
                    </select>
                  
            </div>
         
            <div>
            <button class="btn1" type="submit" >검색하기</button>
            </div>
            </form>
        </div>
        <div class="form-group">
            
            
                                <div id="map" style="width: 100%; height: 400px;"></div>

                    <!-- 카카오맵 API 키 -->
                    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=60471655287043a8aead75467fe69d0a"></script>
                    <script>
                        var container = document.getElementById('map');
                        var options = {
                            center: new kakao.maps.LatLng(<%= firstPocha != null ? firstPocha.getLat() : 33.450701 %>, <%= firstPocha != null ? firstPocha.getLon() : 126.570667 %>),  // 기본 지도 중심
                            level: 3
                        };

                        var map = new kakao.maps.Map(container, options);

                        <% if (pochaList != null && !pochaList.isEmpty()) { %>
                            <% for (PochaDTO pocha : pochaList) { %>
                                // 마커를 생성하고 지도에 추가
                                var lat = <%= pocha.getLat() %>;
                                var lon = <%= pocha.getLon() %>;
                                var position = new kakao.maps.LatLng(lat, lon);
                                
                                var marker = new kakao.maps.Marker({
                                    position: position
                                });

                                marker.setMap(map);

                                // 마커에 클릭 이벤트를 추가할 수 있습니다 (옵션)
                                kakao.maps.event.addListener(marker, 'click', function() {
                                    alert('<%= pocha.getPocha_name() %>: <%= pocha.getPocha_addr() %> ');
                                });
                            <% } %>
                        <% } %>
                    </script>
                </div>
        </div>
    </div>
    </main>






    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>