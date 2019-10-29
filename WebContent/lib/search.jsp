<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="search.SearchDAO"%>
<%@page import="search.SearchDTO"%>
<%@page import="java.util.*"%>
<jsp:useBean id="dto" class="search.SearchDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto" />

<%
	int presentpage = Integer.parseInt(request.getParameter("page"));
	String searchname = request.getParameter("name");

	SearchDAO dao = new SearchDAO();
	ArrayList<SearchDTO> list = dao.search(dto.getName());

	int bookcount = list.size();
	
	int pagecount;
	if(bookcount%12==0){
	pagecount = bookcount/12;
	} else {
	pagecount = bookcount/12 + 1;
	}

	int[] bookblock = new int[pagecount];
	
	for(int i = 0; i<bookblock.length; i++){
		if(i == bookblock.length-1 && bookcount%12 != 0){
				bookblock[i] = bookcount%12;
		} else {
		bookblock[i] = 12;
		}
	}
	
	int[] pagearray = new int[pagecount];
	ArrayList<Integer> arraylist = new ArrayList();
	for (int i = 0; i < pagearray.length; i++) {
		pagearray[i] = i+1;
	}
	if(presentpage+9>pagecount && presentpage-9<1){
		for(int i=0; i<pagearray.length; i++){
			arraylist.add(pagearray[i]);
		}
	} else if(presentpage+9<=pagecount && presentpage-9<1){
		if(presentpage-4<1){
			for(int i=0; i<10; i++){
				arraylist.add(pagearray[i]);
			}
		} else {
			for(int i=presentpage-5; i<presentpage+4; i++){
				arraylist.add(pagearray[i]);
			}
		}
	} else if(presentpage+9>pagecount && presentpage-9>=1) {
		if(presentpage+5>pagecount){
			for(int i=pagecount-10; i<pagecount; i++){
				arraylist.add(pagearray[i]);
			}
		} else {
			for(int i=presentpage-5; i<presentpage+5; i++){
				arraylist.add(pagearray[i]);
			}
		}
	} else{
		for(int i=presentpage-5; i<presentpage+4; i++){
			arraylist.add(pagearray[i]);
		}
	}
	
%>

<%
	String id=(String)session.getAttribute("id") ;
%>

<%
	String recentbname1 = null;
	String recentbimg1 = null;
	String recentbisbn1 = null;
	
	String recentbname2 = null;
	String recentbimg2 = null;
	String recentbisbn2 = null;

	Cookie[] presentcookies = request.getCookies();
	
	for(int i=0; i < presentcookies.length; i++){
	Cookie cookie = presentcookies[i];
		if(cookie.getName().equals("first_isbn")){
			recentbisbn1 = cookie.getValue();
		} else if(cookie.getName().equals("first_name")){
			recentbname1 = cookie.getValue().replace("$", " ");
		} else if(cookie.getName().equals("first_img")){
			recentbimg1 = cookie.getValue();
		} else if(cookie.getName().equals("second_isbn")){
			recentbisbn2 = cookie.getValue();
		} else if(cookie.getName().equals("second_name")){
			recentbname2 = cookie.getValue().replace("$", " ");
		} else if(cookie.getName().equals("second_img")){
			recentbimg2 = cookie.getValue();
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
    <script src="http://localhost:8080/bigproject2/js/tag.js"></script>
    <script type="text/javascript" src="../js/login.js"></script>
    <script>function showPopup() { window.open("../lib/signup.jsp", "a", "width=400, height=550, left=800, top=150"); }</script>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/board.css">
    <style>
    /*  style="background-color: #ef7479 */
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

        <div class="content" style="margin: 10px;" id="content">
        <%if(list.size()==0){%>
        <div><img src="../img/noresult.png" style="display: block; margin: 0px auto; margin-top: 120px;"></div>
        <%} else{%>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">ISBN</th>
                        <th scope="col">책 제목</th>
                        <th scope="col">저자이름</th>
                        <th scope="col">출판사</th>
                    </tr>
                </thead>
                <tbody id="tbody-list">
                    <%for(int i =0; i<bookblock[presentpage-1]; i++){%>
                    	<tr class="bookrows">
                    	<td class="isbns"><%=list.get((presentpage-1)*12 + i).getIsbn()%></td>
                    	<td class="names"><%=list.get((presentpage-1)*12 + i).getName()%></td>
                    	<td><%=list.get((presentpage-1)*12 + i).getWriter()%></td>
                    	<td><%=list.get((presentpage-1)*12 + i).getCompany()%></td>
                    	</tr>
                   <%}%>
                </tbody>
            </table>
            <%}%>
            <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups" style="justify-content: center;">
            <%if(bookcount==0){%>
            <%} else{%>
                <div class="btn-group mr-2" role="group" aria-label="First group">
                    <% for(int i=0; i<arraylist.size(); i++){%>
                    <form action="http://localhost:8080/bigproject2/lib/search.jsp">
                    <input type="hidden" name="name" value=<%=searchname%>>
                    <%if(presentpage == arraylist.get(i)){%>
                    <button type="submit" class="btn btn-secondary page" name="page" value=<%=arraylist.get(i)%>  style="background-color: #ef7479"><%=arraylist.get(i)%></button>
                    <%} else{%>
                    <button type="submit" class="btn btn-secondary page" name="page" value=<%=arraylist.get(i)%>><%=arraylist.get(i)%></button>
                    <%}%>
                    </form>
                    <%}%>
                </div>
            <%}%>
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
