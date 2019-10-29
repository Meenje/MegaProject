<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="DAO.BookDAO"%>
<%@page import="DTO.BookInfoDTO"%>
<%@page import="DTO.BookpossessionDTO"%>
<%@page import="DAO.BookPossessionDAO"%>
<%@page import="DTO.CountmonthDTO"%>
<%@page import="DAO.CountMonthDAO"%>

<!DOCTYPE html>
<html lang="UTF-8">

<head>
   <title></title>
   <meta charset="UTF-8">
   <script src="../js/jquery-3.4.1.js"></script>
   
   <script src="../mainGF/mainGF.js"></script>
   <script type="text/javascript" src="../js/login.js"></script>
   <script type="text/javascript" src="../js/userInfo.js"></script>
   
   <link rel="stylesheet" href="../css/bootstrap.css">
   <link rel="stylesheet" href="../css/main.css">
</head>
   
<%
String id=(String)session.getAttribute("id") ;
%>

<body>
   <div class="grid-container">
      <div class="Top1"></div>
      <div class="Top2"></div>
      <div class="Top3"style="margin-left: 274px; margin-top: 5px; margin-bottom: 5px;">
         
         <!--로그인  -->
      <% if(id != null){ %>
            <%=id %>님 환영합니다~
            <button type="button" class="btn btn-primary btn-sm" id="logoutbtn" style="background-color: #F3969A; border-color: #F3969A;">로그아웃</button>
            <button type="button" class="btn btn-primary btn-sm" id="mypagebtn"   style="background-color: #F3969A; border-color: #F3969A;">회원정보수정</button>
      <%}else{ %>
            <input type="text" placeholder="아이디" style="margin-left: 10px; vertical-align: middle;" id="id" name="id"> 
            <input type="text" placeholder="비밀번호" style="margin-left: 3px; vertical-align: middle;" id="pw" name="pw">
            <button type="button" class="btn btn-primary btn-sm" id="loginbtn" >Login</button>
            <button type="button" class="btn btn-primary btn-sm" id="signupbtn"
               onclick="showPopup();"
               style="background-color: #F3969A; border-color: #F3969A;">SignUp</button>
      <% } %>

      </div>
      <div class="Menu">
         <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <a class="navbar-brand" href="#">메뉴</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse"
               data-target="#navbarColor01" aria-controls="navbarColor01"
               aria-expanded="false" aria-label="Toggle navigation">
               <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarColor01">
               <ul class="navbar-nav mr-auto">
                  <li class="nav-item active"><a class="nav-link"
                     href="main.jsp">Home</a> <!-- current --></li>
                  <li class="nav-item"><a class="nav-link" href="typical.jsp">유형별
                        도서 인기 검색</a></li>
               </ul>
                    <form class="form-inline my-2 my-lg-0" action="http://localhost:8080/bigproject2/lib/search.jsp">
                        <input class="form-control mr-sm-2" type="text" placeholder="Search" id="searchitem" name="name">
                        <input name="page" value="1" type="hidden">
                        <button class="btn btn-secondary my-2 my-sm-0" type="submit" id="btn-search">Search</button>
                    </form>
            </div>
         </nav>
      </div>
      <!--강남인기도서-->
      <div class="PopularLoanBook" style="margin-top: 20px; margin-right: 40px; margin-left: 40px">
            <h2>강남 인기 도서</h2>
            <ul class="tabs">
                <li class="tab-link current" data-tab="tab-1" id = "atag1">전체</li>
                <li class="tab-link" data-tab="tab-2" id = "atag2">연령</li>
                <li class="tab-link" data-tab="tab-3" id = "atag3" >성별 </li>
                <li class="tab-link" data-tab="tab-4" id= "atag4">주제</li>
            </ul>  
         
         <!--강남인기도서-전체 -->
            <div id="tab-1" class="tab-content current">
                <div id="dimg">
                    <table id="timg"
                        style="margin:auto; text-align:center; width:60%; border-spacing: 10px; border-collapse: separate;">
                             <tr id="tr">
                               <td id = "GT1"> </td>                         
                               <td id = "GT2"> </td>                         
                               <td id = "GT3"> </td>                         
                               <td id = "GT4"> </td>                         
                               <td id = "GT5"> </td>                         
                             </tr>                                                
                    </table>
                </div>
            </div>
            
            <!--강남인기도서-연령-->
            <div id="tab-2" class="tab-content">
            
                <a href="" id="0_5" >영유아(0~5)</a>  <!--강남인기도서-총류 -->
                <a href="" id = "6_7">_유아(6~7) </a> 
                <a href="" id = "8_13">초등(8~13) </a>
                <a href="" id = "14_19">청소년(14~19) </a>
                <a href="" id = "20" >20대 </a>
                <a href="" id = "30">30대 </a>
                <a href="" id = "40">40대</a>
                <a href="" id = "50">50대  </a>
                <a href="" id = "60">60대 이상 </a>
                
                <br>
                   <table id="aimg"
                        style="margin:auto; text-align:center; width:60%; border-spacing: 10px; border-collapse: separate;">
                        <tr>
                               <td id = "GT1"> </td>                         
                               <td id = "GT2"> </td>                         
                               <td id = "GT3"> </td>                         
                               <td id = "GT4"> </td>                         
                               <td id = "GT5"> </td>      
                               </tr>                   
                                                
                    </table>             
            </div>
         
         <!--강남인기도서-성별 -->
            <div id="tab-3" class="tab-content">
                <a href="" id="atag3">남</a> 
                <a href="" id="atag14">여</a>
                <table id="gimg"
                        style="margin:auto; text-align:center; width:60%; border-spacing: 10px; border-collapse: separate;">
                        <tr>
                               <td> </td>                         
                               <td> </td>                         
                               <td> </td>                         
                               <td> </td>                         
                               <td> </td>                         
                               </tr>
                    </table>
            </div>

         <!--강남인기도서-주제 -->
            <div id="tab-4" class="tab-content">
                  <a href="" id="atag4">총류   </a> 
                <a href="" id="atag15">철학 </a> 
                <a href="" id="atag16">종교  </a>
                <a href="" id="atag17">사회과학  </a>
                <a href="" id="atag18">자연과학  </a>
                <a href="" id="atag19">기술과학 </a>
                <a href="" id="atag20">예술 </a>
                <a href="" id="atag21">언어  </a>
                <a href="" id="atag22">문학 </a>
                <a href="" id="atag23">역사  </a>
                <br>
                <table id="simg"
                        style="margin:auto; text-align:center; width:60%; border-spacing: 10px; border-collapse: separate;">
                        <tr>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  </tr>
               </table>
            </div>
        </div>
        
      <!-- 전국인기도서 -->
        <div class="NationalBook" style="margin: 20px">
            <div class="card border-secondary mb-3">
                <div class="card-header">전국 인기 도서</div>
                <div style="margin-top: 10px; margin-right: 10px; margin-left: 10px;">
                 <form action = "http://localhost:8080/bigproject2/mainGF/Bestga.jsp">
                   <label>성별: </label>
                    <input class="nationalgender" type="radio"  name="gender" value="male" checked>남자
                    <input class="nationalgender" type="radio"  name="gender" value="female">여자
                    </form>
                </div>
                <div style="margin-top: 5px; margin-right: 10px; margin-left: 10px;">
                 <form action = "http://localhost:8080/bigproject2/mainGF/Bestga.jsp">
                    <label for="example">연령</label>
                    <select id="nationalcb" class="autocomplete">
                        <option value="0_5"  >영유아(0~5)</option>
                        <option value="6_7" >유아(6-7) </option>
                        <option value="8_13" >초등(8-13)</option>
                        <option value="14_19" >청소년(14-19)</option>
                        <option value="20" >20대</option>
                        <option value="30">30대 </option>
                        <option value="40" >40대</option>
                        <option value="50" >50대</option>
                        <option value="60" >60대 이상</option>
                    </select>
                  </form>
                    
                </div>
                <div class="card-body" align ="center">
               <table id = "nimg"  style="border-spacing: 10px;  border-collapse: separate;">
               <tr>
                     <td></td>
                     <td></td>
                     <td></td>
                <!-- <td align = "center"> <a href = "../lib/bookinfo.jsp?isbn=9788936446819&name=수박"><img src="http://image.kyobobook.co.kr/images/book/large/819/l9788936446819.jpg" width="160" height="215">수박 수영장 :안녕달 그림책  </a></td>
            <td align = "center"> <a href = "../lib/bookinfo.jsp?isbn=9788958284482&name=감기"><img src="http://image.kyobobook.co.kr/images/book/large/482/l9788958284482.jpg" width="160" height="215">감기 걸린 물고기   </a></td>
                 <td align = "center"> <a href = "../lib/bookinfo.jsp?isbn=9788966350278&name=바다"><img src="http://image.kyobobook.co.kr/images/book/large/278/l9788966350278.jpg" width="160" height="215">바다 100층짜리 집</a></td> -->
             	</tr>
                  </table>     
                </div>
            </div>
        </div>

      <!--강남인기급상승도서 -->
        <div class="PopBook" style="margin-top: 20px">
            <div class="card border-success mb-3">
                <div class="card-header">강남 인기 급상승 도서</div>
                <div class="card-body">
                    <table id="rimg"
                        style="margin:auto; text-align:center; width:60%;border-spacing: 10px; border-collapse: separate;">
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="NewBook" style="margin-top: 20px">
            <div class="card border-warning mb-3">
                <div class="card-header">신간 도서</div>
                <div style="margin: 10px">
                    <select id="example" class="autocomplete">
                        <option value="강남" id= "value10" name = "lname">강남도서관</option>
                        <option value="개포" id = "value11" name = "lname">개포도서관</option>
                        <option value="논현" id = "value12"  name = "lname">논현도서관</option>
                        <option value="대치" id = "value13" name = "lname">대치도서관</option>
                        <option value="도곡" id = "value14" name = "lname">도곡정보문화도서관</option>
                        <option value="못골" id = "value15" name = "lname">못골도서관</option>
                        <option value="한옥" id = "value16" name = "lname">못골한옥어린이도서관</option>
                        <option value="역삼" id = "value17" name = "lname">역삼도서관</option>
                        <option value="푸른솔" id = "value18" name = "lname">역삼푸른솔도서관</option>
                        <option value="정다운" id = "value19" name = "lname">정다운도서관</option>
                        <option value="즐거운" id = "value20" name = "lname">즐거운도서관</option>
                        <option value="청담" id = "value21" name = "lname">청담 도서관</option>
                        <option value="헹복한" id = "value22" name = "lname">행복한도서관</option>
                    </select>
                </div>

                <div class="card-body">
                <table id="nbimg"
                        style="margin:auto; text-align:center; width:60%; border-spacing: 10px; border-collapse: separate;">
                        <tr>
                           <td></td>
                           <td></td>
                           <td></td>
                           </tr>
                          <!--  <td> <a href = "../lib/bookinfo.jsp?isbn=9788901225043&name=순간의"><img src="http://image.kyobobook.co.kr/images/book/large/043/l9788901225043.jpg" width="160" height="215">순간의 힘 :평범한 순간을 결정적 기회로 바꾸는 경험 설계의 기술</a></td>
                             <td> <a href = "../lib/bookinfo.jsp?isbn=9788901227399&name=속임수의"><img src="http://image.kyobobook.co.kr/images/book/large/399/l9788901227399.jpg" width="160" height="215">속임수의 심리학 :눈에 보이는 것이 전부는 아니다!</a></td>
                             <td> <a href = "../lib/bookinfo.jsp?isbn=9788925566740&name=돈의"><img src="http://image.kyobobook.co.kr/images/book/large/740/l9788925566740.jpg" width="160" height="215">돈의 진리</a></td> -->
                </table>
                </div>
            </div>
        </div>
    </div>
</body>

</html>