<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="signup.MemberDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="dto" class="signup.MemberDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="dto" />
	<%
		MemberDAO dao = new MemberDAO();
		boolean check = dao.checkID(dto);
		
		if(check){
			out.print("<font color=red>사용불가능한 아이디입니다</font>");
		} else {
			out.print("<font color=blue>사용가능한 아이디입니다</font>");		
		}
	%>
</body>
</html>