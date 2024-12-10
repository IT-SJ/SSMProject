<%@page import="com.SSMProject.model.PochaDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SSM 포장마차</title>
<!-- 부트스트랩 CSS -->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
   rel="stylesheet" crossorigin="anonymous">
<link rel="stylesheet" href="assets/css/Category.css">
<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
   href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic&family=Noto+Sans+KR:wght@100..900&family=Noto+Sans:ital,wght@0,100..900;1,100..900&display=swap"
   rel="stylesheet">
   
   <!-- Jquery import -->
   <script src="assets/js/jquery-3.7.1.min.js"></script>
</head>

<body>
   <!-- 네비게이션 바 -->

   <%@include file="Header.jsp"%>
   <!-- 리스트 출력 되는 곳 -->
   <%
   String city = result.getCity();
   String district = result.getDistrict();
   String menu = (String) request.getParameter("menu");
   ArrayList<PochaDTO> pocha = (ArrayList) request.getAttribute("pochalist");
   %>

   <main>
      <section class="py-5 text-center container">
         <div class="row py-lg-5">
            <div class="col-lg-6 col-md-8 mx-auto">
               <h1 class="fw-bolder"><%=city%><%=district%>
                  <%=menu%>
                  포장마차
               </h1>
               <p class="lead text-body-secondary">동네의 포장마차를 찾아보세요!</p>
            </div>
         </div>
      </section>
      <div class="album py-5 bg-body-tertiary">
         <div class="container">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <%
            if (pocha != null) {
               for (int i = 0; i < pocha.size(); i++) {
            %>
               <div class="col">
                  <div class="card shadow-sm" onclick="window.location.href='PochaDetail?title=<%=pocha.get(i).getPocha_name()%>'">
                     <svg class="bd-placeholder-img card-img-top" width="100%"
                        height="225" xmlns="http://www.w3.org/2000/svg" role="img"
                        aria-label="Placeholder: Thumbnail"
                        preserveAspectRatio="xMidYMid slice" focusable="false">
                        <title>Placeholder</title><image href="<%=pocha.get(i).getUploadPath() %>" width="100%" height="100%" />
                        </svg>
                     <div class="card-body">
                        <p class="card-text"><%=pocha.get(i).getPocha_name()%></p>
                        <p class="card-text">운영시간 : <%=pocha.get(i).getShopoper_start() %> ~ <%= pocha.get(i).getShopoper_end()%></p>
                        <div class="d-flex justify-content-between align-items-center">
                           <div class="btn-group">
                              <button type="button" class="btn btn-sm btn-outline-secondary" id=<%=pocha.get(i).getPocha_idx()%>>♥</button>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            <%
            }
            }
            %>

            </div>
         </div>
      </div>
      
   </main>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"></script>

   <script>   
   
      let btn = document.getElementsByClassName("btn btn-sm btn-outline-secondary") 
      let btns = Array.from(btn);
            
      btns.forEach(item => {
         item.addEventListener("click",()=>{
            $.ajax({
               type:"post",
                   url:"Favorite",
                   dataType: 'text',
                   data: {pochaidx : item.getAttribute("id")},
                   success:(res) =>{
                      alert("즐겨찾기 성공!")
                   },
                   error: () =>{
                  alert("즐겨찾기 등록실패")
                   }
               })
         })         
       });
                                /* btn.addEventListener("click",()=>{
                                    $.ajax({
                                    type:"post",
                                        url:"Favortie",
                                        data: {pochaidx : pocha.get(i).getPocha_idx()},
                                        success:(res) =>{
                                           alert("즐겨찾기 성공!")
                                        },
                                        error: () =>{
                                       alert("즐겨찾기 등록실패")
                                        }
                                    })
                                }) */
                                
   </script>

</body>

</html>