<%@page import="DAO.BookDAO"%>
<%@page import="DTO.BookInfoDTO"%>
<%@page import="DTO.BookpossessionDTO"%>
<%@page import="DAO.BookPossessionDAO"%>
<%@page import="DTO.CountmonthDTO"%>
<%@page import="DAO.CountMonthDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		
<%
	String id=(String)session.getAttribute("id");
		
	String isbn = request.getParameter("isbn");
	String name = request.getParameter("name");
					
	BookInfoDTO dto = new BookInfoDTO();
	dto.setIsbn(isbn);
	dto.setName(name);
					
	BookDAO dao = new BookDAO();
	BookInfoDTO dto2 = dao.selectBookinfo(dto);
					
	BookInfoDTO dto3 = new BookInfoDTO();
	dto3.setIsbn(isbn);
	dto3.setName(name);
					
	BookPossessionDAO dao1 = new BookPossessionDAO();
	BookpossessionDTO dto4 = dao1.selectlibrary(dto3);	

	CountMonthDAO dao3 = new CountMonthDAO();
	CountmonthDTO dto5 = dao3.selectcount(dto3);

%>

<!-- 쿠키쿠키 -->

<%	
 	Cookie[] presentcookies = request.getCookies();

	for(int i=0; i < presentcookies.length; i++){
	Cookie cookie = presentcookies[i];
		if(cookie.getName().equals("first_isbn")){
			Cookie cookie3 = new Cookie("second_isbn", cookie.getValue());
			response.addCookie(cookie3);
		} else if(cookie.getName().equals("first_name")){
			Cookie cookie4 = new Cookie("second_name", cookie.getValue());
			response.addCookie(cookie4);
		} else if(cookie.getName().equals("first_img")){
			Cookie cookie5 = new Cookie("second_img", cookie.getValue());
			response.addCookie(cookie5);
		}
	}
	
	String nospace = name.replace(" ", "$");
 	Cookie bookcookie1_1 = new Cookie("first_isbn", isbn);
	Cookie bookcookie1_2 = new Cookie("first_name", nospace);
	Cookie bookcookie1_3 = new Cookie("first_img", dto2.getImg());

	response.addCookie(bookcookie1_1);
	response.addCookie(bookcookie1_2); 
	response.addCookie(bookcookie1_3); 
%>

<%
	String recentbname1 = null;
	String recentbimg1 = null;
	String recentbisbn1 = null;
	
	String recentbname2 = null;
	String recentbimg2 = null;
	String recentbisbn2 = null;

	Cookie[] presentcookies2 = request.getCookies();
	
	for(int i=0; i < presentcookies2.length; i++){
	Cookie cookiee = presentcookies2[i];
		if(cookiee.getName().equals("first_isbn")){
			recentbisbn1 = cookiee.getValue();
		} else if(cookiee.getName().equals("first_name")){
			recentbname1 = cookiee.getValue().replace("$", " ");
		} else if(cookiee.getName().equals("first_img")){
			recentbimg1 = cookiee.getValue();
		} else if(cookiee.getName().equals("second_isbn")){
			recentbisbn2 = cookiee.getValue();
		} else if(cookiee.getName().equals("second_name")){
			recentbname2 = cookiee.getValue().replace("$", " ");
		} else if(cookiee.getName().equals("second_img")){
			recentbimg2 = cookiee.getValue();
		}
	}
%>
		
<!DOCTYPE html>
<html lang="UTF-8">

<head>
    <title></title>
    <meta charset="UTF-8">
    <script src="../js/jquery-3.4.1.js"></script>
    <script src="../js/leftside.js"></script>
   	<!--  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> -->
    
    <!-- 로그인하기  -->
   
    <script type="text/javascript" src="../js/login.js"></script>
    
    <script type="text/javascript" src="../js/bookinfo.js"></script>
     
    <!-- JQ-PLOT의 CSS를 설정 -->  
    <link class="include" rel="stylesheet" type="text/css" href="../css/jquery.jqplot.css"/></link>  
    <!-- JQ-PLOT의 기본 설정 -->  
    <script type="text/javascript" src="../js/jquery.jqplot.js"/></script>
    <!-- 축의 데이터를 날짜형태로 입력하기 위해서 설정 -->  
	<script type="text/javascript" src="../js/jqplot.dateAxisRenderer.js"/></script>
    <!-- Highlighter(마우스 접근시 데이터정보 표시) 설정 -->  
    <script type="text/javascript" src="../js/jqplot.highlighter.js"/></script>
    <!-- 좌표에 관한 정보나 Zoom 기능 사용시 설정 -->  
    <script type="text/javascript" src="../js/jqplot.cursor.js"/></script>
    <!-- 축의 데이터 표현설정과 그래프위의 점의 Option을 설정 -->  
    <script type="text/javascript" src="../js/jqplot.canvasAxisTickRenderer.js"/></script>
    <!-- 축의 데이터의 Label Option을 설정 -->  
    <script type="text/javascript" src="../js/jqplot.canvasAxisLabelRenderer.js"/></script>
    
    
    
    <!-- <script src="../js/board.js"></script> -->
   <!--  <script type="text/javascript" src="../js/signup.js"></script> -->
    <script>function showPopup() { window.open("signup.jsp", "a", "width=400, height=550, left=800, top=150"); }</script>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/book.css">
    <style>
    </style>
</head>

<body>
    <div class="grid-container">
        <div class="Top1"></div>
        <div class="Top2"></div>
        <div class="Top3" style="margin-left: 274px; margin-top: 5px; margin-bottom: 5px;">
        	
            	<!--로그인  -->
			<% 
			if(id != null){
			%>
				<%=id %>님 환영합니다~
				<button type="button" class="btn btn-primary btn-sm" id="logoutbtn" style="background-color: #F3969A; border-color: #F3969A;">로그아웃</button>
				<button type="button" class="btn btn-primary btn-sm" id="mypagebtn"	style="background-color: #F3969A; border-color: #F3969A;">회원정보수정</button>
		<%}else{ %>
				<input type="text" placeholder="아이디" style="margin-left: 10px; vertical-align: middle;" id="id" name="id" value = "root1234"> 
				<input type="text" placeholder="비밀번호" style="margin-left: 3px; vertical-align: middle;" id="pw" name="pw" value = "1234">
				<button type="button" class="btn btn-primary btn-sm" id="loginbtn" >Login</button>
				<button type="button" class="btn btn-primary btn-sm" id="signupbtn"
					onclick="showPopup();"
					style="background-color: #F3969A; border-color: #F3969A;">SignUp</button>
			
		<% } %>
        </div>
        <div class="Menu">
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                <a class="navbar-brand" href="#">메뉴</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01"
                    aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarColor01">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="main.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="typical.jsp">유형별 도서 인기 검색</a>
                        </li>
                    </ul>
                    <form class="form-inline my-2 my-lg-0" action="http://localhost:8080/bigproject2/lib/search.jsp">
                        <input class="form-control mr-sm-2" type="text" placeholder="Search" id="searchitem" name="name">
                        <input name="page" value="1" type="hidden">
                        <button class="btn btn-secondary my-2 my-sm-0" type="submit" id="btn-search">Search</button>
                    </form>
                </div>
            </nav>
        </div>
	
	
        <div class="content" style="margin: 10px; background-color: ivory; border-radius: 0.6rem;">
        	
            	
            <div style="margin: 50px;">
                <table id = "bookinfo">
                    <thead>
                    <tr>
                        <th scope='col'  id="bname" colspan="7"  value = '<%=dto2.getName()%>'><%=dto2.getName()%></th>
                    </tr>
                	</thead>
                
                    <tbody><tr>
                        <td rowspan="4" id = "img"><img src = '<%=dto2.getImg()%>'></td>
                        <th>저자정보</th>
                        <td colspan="5" id = "writer"><%=dto2.getWriter()%></td>
                    </tr>
                    <tr>
                        <th>출판사</th>
                        <td colspan="5" id = "company"><%=dto2.getCompany()%></td>
                    </tr>
                    <tr>
                        <th>출판년월</th>
                        <td id = "pyear"><%=dto2.getPyear()%></td>
                        <th>isbn정보</th>
                        <td id = "isbn1"><input type="hidden" id="viewisbn" value = '<%=dto.getIsbn()%>'><%=dto.getIsbn()%></td>
                        <th>주제</th>
                        <td id = "kdc"><%=dto2.getKdc()%></td>
                    </tr>
                    <tr>
                    	<th>보유 도서관</th>
                    	<td colspan="5" id = "libname"></td>  	
                    </tr>
            		</tbody>
                </table>
            </div>
        </div>
        
		<div class="graph">
			<h2>도서 대출 추이</h2>
			<div class="graph" id = "graph">
			
			</div>
            
        </div>


        <div class="leftside" style="margin: 20px;">
            <div style="overflow-y: auto; position:fixed; margin-left: 23px;">
			<div class="card mb-3" style="width: 225px; height: auto;">
  				<h3 class="card-header">강남 신규도서</h3>
  				<div class="card-body" id="div-gangnam" style="margin-left: 20px; margin-right: 25px; text-align: center;">
  				</div>
  			</div>
  			<div class="card mb-3" style="width: 225px; height: auto;">
  				<h3 class="card-header">개포 신규도서</h3>
  				<div class="card-body" id="div-gaepo" style="margin-left: 20px; margin-right: 25px; text-align: center;">
  				</div>
  			</div>
        </div>
        </div>
        <div class="rightside" style="margin: 20px;">
            <div style="overflow-y: auto; position:fixed; margin-left: 23px;">
				<div class="card mb-3" style="width: 225px; height: auto;">
  					<h3 class="card-header">최근 본 책들</h3>
  					<div class="card-body" id="div-book1" style="margin-left: 20px; margin-right: 25px; text-align: center;">
  					<img src='<%=recentbimg1%>' style="height: 180px; width: 130px; display: block;">
  					<a href="http://localhost:8080/bigproject2/lib/bookinfo.jsp?isbn=<%=recentbisbn1%>&name=<%=recentbname1%>" class='card-link'><%=recentbname1%></a>
  					</div>
  					<div class="card-body" id="div-book2" style="margin-left: 20px; margin-right: 25px; text-align: center;">
  					<img src='<%=recentbimg2%>' style="height: 180px; width: 130px; display: block;">
  					<a href="http://localhost:8080/bigproject2/lib/bookinfo.jsp?isbn=<%=recentbisbn2%>&name=<%=recentbname2%>" class='card-link'><%=recentbname2%></a>
  					</div>
  				</div>
        	</div>
        </div>
    </div>
</body>

</html>
		
		
		