<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="DTO.MemberDTO"%>
<%@page import="DAO.MemberDAO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
		
		
		<% request.setCharacterEncoding("utf-8"); %>
		<jsp:useBean id="dto" class="DTO.MemberDTO"></jsp:useBean>
		<jsp:setProperty property="*" name="dto" /> 
		
		<%
	      
	      MemberDAO dao = new MemberDAO();
	      // MemberDTO dto = new MemberDTO();
	      
	      int check = dao.userupdate(dto);
	      
	      
	    %>
		  <% if (check == 1) {
			  %>
			  alert("수정완료");
			  location.href = "../jsphome/main.jsp";
		  
		<% 
			}else { %>
			  alert("패스워드 틀림");
			  history.back();
			  <%
		   }
			 
		  %>
	      
	   
     console.log(check);
     <%=check %>
     
   
  