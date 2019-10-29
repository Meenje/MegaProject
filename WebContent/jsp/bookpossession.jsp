<%@page import="DTO.BookpossessionDTO"%>
<%@page import="DAO.BookPossessionDAO"%>
<%@page import="DTO.CountmonthDTO"%>
<%@page import="DAO.CountMonthDAO"%>
<%@page import="DAO.BookDAO"%>
<%@page import="DTO.BookInfoDTO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		
		
		<%
			String isbn = request.getParameter("isbn");
			String name = request.getParameter("name");
			
			BookInfoDTO dto5 = new BookInfoDTO();
			dto5.setIsbn(isbn);
			dto5.setName(name);
			
			BookPossessionDAO dao2 = new BookPossessionDAO();
			BookpossessionDTO dto4 = dao2.selectlibrary(dto5);
			
			JSONObject jo2 = new JSONObject();
			
			jo2.put("isbn",dto4.getIsbn());
			jo2.put("bookname",dto4.getName());
			jo2.put("l1",dto4.getNonhyeon());
			jo2.put("l2",dto4.getDaechi());
			jo2.put("l3",dto4.getDogog());
			jo2.put("l4",dto4.getMosgol());
			jo2.put("l5",dto4.getHanog());
			jo2.put("l6",dto4.getYeogsam());
			jo2.put("l7",dto4.getPuleunsol());
			jo2.put("l8",dto4.getJeongdaun());
			jo2.put("l9",dto4.getJeulgeoun());
			jo2.put("l10",dto4.getCheongdam());
			jo2.put("l11",dto4.getHaengboghan());
			jo2.put("l12",dto4.getGangnam());
			jo2.put("l13",dto4.getGaepo());
			
			
		%>
		
		<%=jo2.toJSONString()%>
