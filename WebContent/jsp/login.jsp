<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="DTO.MemberDTO"%>
<%@page import="DAO.MemberDAO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
		
		<%-- <jsp:useBean id="dto" class="DTO.MemberDTO"></jsp:useBean>
		<jsp:setProperty property="*" name="dto" /> --%>
		
		<%
		
		  String id = request.getParameter("id");
	      String pw = request.getParameter("pw");
	      
	      MemberDAO dao = new MemberDAO();
	      MemberDTO dto = new MemberDTO();
	      dto.setId(id);
	      
	      MemberDTO dto1 = dao.login(dto);
	     
	      int loginchek = 0;
	   
	      if(id.equals(dto1.getId()) && pw.equals(dto1.getPw())){
	      	session.setAttribute("id", id);
	      	loginchek = 1;
					      	
	      }else {
	      	out.print("아이디 또는 비밀번호가 틀렸습니다.");
	      }
	
	   %>
     
     <%=loginchek %>
     
   
  