<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="DTO.CountmonthDTO"%>
<%@page import="DAO.CountMonthDAO"%>
<%@page import="DTO.BookInfoDTO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>

<%
	String isbn = request.getParameter("isbn");
	String name = request.getParameter("name");
	
	System.out.println("isbn");
	System.out.println(isbn);
	System.out.println("name");
	System.out.println(name);
	
	BookInfoDTO dto5 = new BookInfoDTO();
	
	dto5.setIsbn(isbn);
	dto5.setName(name);

	CountMonthDAO dao = new CountMonthDAO();
	CountmonthDTO dto6 = dao.selectcount(dto5);
	
	JSONObject jsonobject = new JSONObject();
	
	jsonobject.put("m09",dto6.getM09());
	jsonobject.put("m10",dto6.getM10());
	jsonobject.put("m11",dto6.getM11());
	jsonobject.put("m12",dto6.getM12());
	jsonobject.put("m01",dto6.getM01());
	jsonobject.put("m02",dto6.getM02());
	jsonobject.put("m03",dto6.getM03());
	jsonobject.put("m04",dto6.getM04());
	jsonobject.put("m05",dto6.getM05());
	jsonobject.put("m06",dto6.getM06());
	jsonobject.put("m07",dto6.getM07());
	jsonobject.put("m08",dto6.getM08());
	
%>

<%=jsonobject.toJSONString()%>