<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="bookontherun.BookontherunDAO"%>
<%@page import="bookontherun.BookontherunDTO"%>
<%@page import="search.SearchDTO"%>
<%@page import="search.SearchDAO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.*"%>

<jsp:useBean id="dto" class="bookontherun.BookontherunDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto" />

<%
	BookontherunDAO dao = new BookontherunDAO();
	ArrayList<BookontherunDTO> list = dao.select(dto);
	
	SearchDAO sdao = new SearchDAO();
	SearchDTO sdto = null;
	ArrayList<SearchDTO> booklist = new ArrayList();
	
	for(int i=0; i<18; i++){
		sdto = new SearchDTO();
		sdto.setIsbn(list.get(i).getIsbn());
		sdto.setName(list.get(i).getName());
		booklist.add(sdao.searchBook(sdto));
	}
	
	JSONObject jso = null;
	JSONArray jsonarray = new JSONArray();
	for(int i=0; i<booklist.size(); i++){
		jso = new JSONObject();
		jso.put("isbn", booklist.get(i).getIsbn());
		jso.put("name", booklist.get(i).getName());
		jso.put("writer", booklist.get(i).getWriter());
		jso.put("company", booklist.get(i).getCompany());
		jso.put("pyear", booklist.get(i).getPyear());
		jso.put("kdc", booklist.get(i).getKdc());
		jso.put("img", booklist.get(i).getImg());
		jsonarray.add(jso);
	}
%>

<%=jsonarray.toJSONString()%>