<%@page import="DTO.NewbookDTO"%>
<%@page import="DAO.NewBookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="DTO.BookInfoDTO"%>
<%@page import="DAO.BookinfoDAO"%>

<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>

<jsp:useBean id="dto" class="DTO.NewbookDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto" />

<%
	NewBookDAO dao = new NewBookDAO();
	BookinfoDAO dao2 = new BookinfoDAO();
	
	ArrayList<NewbookDTO> list = dao.selectALL(dto);
	ArrayList<BookInfoDTO> list2 = new ArrayList<>();
		
      for(int i = 0; i<list.size(); i++){
    	NewbookDTO dto4 = list.get(i);
		BookInfoDTO dto5 = dao2.select2(dto4);
		list2.add(dto5);
	}

	JSONArray list3 = new JSONArray();
    for(int i = 0; i<list2.size(); i++){
		BookInfoDTO dto6 = list2.get(i);
		JSONObject js  = new JSONObject();
		js.put("name", dto6.getName());
		js.put("isbn", dto6.getIsbn());
		js.put("img", dto6.getImg());
		
		list3.add(js);
	}

    for(int i = 0; i<list3.size(); i++){
    	 JSONObject j = (JSONObject)list3.get(i);
   	}

%>

<%= list3.toJSONString() %> 







