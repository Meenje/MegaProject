<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="DTO.BookInfoDTO"%>
<%@page import="DAO.BookinfoDAO"%>
<%@page import="DTO.BesttotalDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="DAO.BesttotalDAO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>


<%-- <jsp:useBean id="dto" class="signup.BesttotalDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto" />
<jsp:useBean id="dto2" class="signup.BookinfoDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto2" /> --%>

<%
	//정보를 받아온다.

	BesttotalDAO dao = new BesttotalDAO();
	BookinfoDAO dao2 = new BookinfoDAO();
//5개의 리스트를 가지고 오고,
	ArrayList<BesttotalDTO> list = dao.selectALL();
	ArrayList<BookInfoDTO> list2 = new ArrayList<>();
		
      for(int i = 0; i<list.size(); i++){
		BesttotalDTO dto4 = list.get(i);
		BookInfoDTO dto5 = dao2.select2(dto4);
		list2.add(dto5);
	}

	
	
	
//9788930219556, Why? 소프트웨어와 코딩
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







