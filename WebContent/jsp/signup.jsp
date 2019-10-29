<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="signup.MemberDAO"%>
<jsp:useBean id="dto" class="signup.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto" />
<%
	MemberDAO dao = new MemberDAO();
	dao.insert(dto);
%>
