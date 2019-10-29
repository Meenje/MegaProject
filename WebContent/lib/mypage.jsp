<%@page import="DTO.MemberDTO"%>
<%@page import="DAO.MemberDAO"%>
<%@page import="DAO.BookDAO"%>
<%@page import="DTO.BookInfoDTO"%>
<%@page import="DTO.BookpossessionDTO"%>
<%@page import="DAO.BookPossessionDAO"%>
<%@page import="DTO.CountmonthDTO"%>
<%@page import="DAO.CountMonthDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		
	
	<%
					String id = (String)session.getAttribute("id") ;		
					
					MemberDAO dao = new MemberDAO();
					MemberDTO dto = new MemberDTO();
					dto.setId(id);
		
					
					
	%>
		
<!DOCTYPE html>
<html lang="UTF-8">

<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="../css/form.css">
<style>
input.ng-invalid {
	border: 5px solid red;
}
</style>
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="../js/form.js"></script> 
<script type="text/javascript" src="../js/signup.js"></script> 

</head>

<body>
	<form name="signUpForm" class="form" role="form">
		<div style="margin: 10px;">
			<h2>회원가입</h2>
			<input type="text" name="id" class="form-control input-lg" id="memberid" placeholder="아이디">
			<div id="iddiv"></div><br>
			<input type="text" name="name" class="form-control input-lg" id="name" placeholder="이름"><br>
			<input type="text" name="tel" class="form-control input-lg" id="tel" required="required" placeholder="전화번호"><br>
			<input type="text" name="email" class="form-control input-lg" id="email" placeholder="이메일"><br>
			<input id="password" type="password" name="password" class="form-control input-lg" placeholder="패스워드">
			<div id="pwdiv"></div><br>
			<input type="password" name="confirm_password" id="confirm" class="form-control input-lg" placeholder="패스워드 재입력">
			<div id="confirmdiv"></div>
			<br> <label>성별: </label>
			<input type="radio" name="gender" value="male" checked>남자
			<input type="radio" name="gender" value="female">여자
			<br>
			<section>
				<fieldset>
					<div class="field moveindate">
						<label for="MoveInDate">생년월일: </label>
						<input autocomplete="off" class="text" id="MoveInDate" name="MoveInDate" type="date"
						min="1900-01-01" max="2019-12-31" spellcheck="false" value="1994-05-30">
					</div>
				</fieldset>
			</section>
			<br> <label style="margin-right: 5px">관심 주제 분야</label><input
				type="checkbox" name="total" value="전체" checked>전체 <br>
			<div id="cbdiv" style="display: none;">
				<input type="checkbox" name="interesting" value="1000000000">총류
				<input type="checkbox" name="interesting" value="0100000000">철학
				<input type="checkbox" name="interesting" value="0010000000">종교
				<input type="checkbox" name="interesting" value="0001000000">사회과학
				<input type="checkbox" name="interesting" value="0000100000">자연과학<br>
				<input type="checkbox" name="interesting" value="0000010000">기술과학
				<input type="checkbox" name="interesting" value="0000001000">예술
				<input type="checkbox" name="interesting" value="0000000100">언어
				<input type="checkbox" name="interesting" value="0000000010">문학
				<input type="checkbox" name="interesting" value="0000000001">역사
			</div>
			<br>
			<div>
				<label>자주 가는 도서관<span>(최대 3개 선택가능)</span></label><br>
				<div style="margin-bottom: 10px;">
					<label>1. </label>
					<select id="sb1" class="selectLibrary">
						<option value="10000000000000">없음</option>
						<option value="11000000000000">강남구립논현도서관</option>
						<option value="10100000000000">강남구립대치도서관</option>
						<option value="10010000000000">강남구립도곡정보문화도서관</option>
						<option value="10001000000000">강남구립못골도서관</option>
						<option value="10000100000000">강남구립못골한옥어린이도서관</option>
						<option value="10000010000000">강남구립역삼도서관</option>
						<option value="10000001000000">강남구립역삼푸른솔도서관</option>
						<option value="10000000100000">강남구립정다운도서관</option>
						<option value="10000000010000">강남구립즐거운도서관</option>
						<option value="10000000001000">강남구립청담도서관</option>
						<option value="10000000000100">강남구립행복한도서관</option>
						<option value="10000000000010">강남도서관</option>
						<option value="10000000000001">개포도서관</option>
					</select><br>
					<label>2. </label>
					<select id="sb2" class="selectLibrary">
						<option value="20000000000000">없음</option>
						<option value="11000000000000">강남구립논현도서관</option>
						<option value="10100000000000">강남구립대치도서관</option>
						<option value="10010000000000">강남구립도곡정보문화도서관</option>
						<option value="10001000000000">강남구립못골도서관</option>
						<option value="10000100000000">강남구립못골한옥어린이도서관</option>
						<option value="10000010000000">강남구립역삼도서관</option>
						<option value="10000001000000">강남구립역삼푸른솔도서관</option>
						<option value="10000000100000">강남구립정다운도서관</option>
						<option value="10000000010000">강남구립즐거운도서관</option>
						<option value="10000000001000">강남구립청담도서관</option>
						<option value="10000000000100">강남구립행복한도서관</option>
						<option value="10000000000010">강남도서관</option>
						<option value="10000000000001">개포도서관</option>
					</select><br>
					<label>3. </label>
					<select id="sb3" class="selectLibrary">
						<option value="30000000000000">없음</option>
						<option value="11000000000000">강남구립논현도서관</option>
						<option value="10100000000000">강남구립대치도서관</option>
						<option value="10010000000000">강남구립도곡정보문화도서관</option>
						<option value="10001000000000">강남구립못골도서관</option>
						<option value="10000100000000">강남구립못골한옥어린이도서관</option>
						<option value="10000010000000">강남구립역삼도서관</option>
						<option value="10000001000000">강남구립역삼푸른솔도서관</option>
						<option value="10000000100000">강남구립정다운도서관</option>
						<option value="10000000010000">강남구립즐거운도서관</option>
						<option value="10000000001000">강남구립청담도서관</option>
						<option value="10000000000100">강남구립행복한도서관</option>
						<option value="10000000000010">강남도서관</option>
						<option value="10000000000001">개포도서관</option>
					</select>
				</div>
			</div>
			<button class="btn btn-lg btn-primary btn-block signup-btn"	type="button" id="signbtn">회원가입</button>
		</div>
	</form>
</body>

</html>