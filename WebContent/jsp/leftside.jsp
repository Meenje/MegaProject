<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="search.SearchDTO"%>
<%@page import="leftside.LeftsideDAO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.*"%>
<%
	LeftsideDAO dao = new LeftsideDAO();

	SearchDTO dto1 = dao.gangnam();
	SearchDTO dto2 = dao.gaepo();
	
	JSONObject jso1 = new JSONObject();
	JSONObject jso2 = new JSONObject();
	
	JSONArray jarr = new JSONArray();
	
	jso1.put("isbn", dto1.getIsbn());
	jso1.put("name", dto1.getName());
	jso1.put("writer", dto1.getWriter());
	jso1.put("company", dto1.getCompany());
	jso1.put("pyear", dto1.getPyear());
	jso1.put("kdc", dto1.getKdc());
	jso1.put("img", dto1.getImg());
	
	jso2.put("isbn", dto2.getIsbn());
	jso2.put("name", dto2.getName());
	jso2.put("writer", dto2.getWriter());
	jso2.put("company", dto2.getCompany());
	jso2.put("pyear", dto2.getPyear());
	jso2.put("kdc", dto2.getKdc());
	jso2.put("img", dto2.getImg());
	
	jarr.add(jso1);
	jarr.add(jso2);
%>

<%=jarr.toJSONString()%>