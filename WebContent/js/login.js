$(function() {
	// 로그인하기
	$("#loginbtn").click(function() {

		var id = $("#id").val();
		var pw = $("#pw").val();
		
		console.log(id);
		console.log(pw);
		
		/* alert(id.length); */
		if(id.length < 1){
			alert("id를 입력하세요");
			$("#id").val("");
			return false;
		};
		
		if(pw.length < 1){
			alert("pw를 입력하세요");
			$("#pw").val("");
			return false;
		}
		
		
		$.ajax({
			url : "http://localhost:8080/bigproject2/jsp/login.jsp",
			data : {
				id : id,
				pw : pw,
			},
			success : function(result) {
				console.log(result);
				
				if(result == 1){
					alert("로그인되었습니다.");
				
					location.href = "../lib/main.jsp"
					
				}else {
					alert("아이디 또는 비밀번호를 다시 확인하세요");	
					return false;
				}
				
			
				
			}
		});
			
		
	});
	
	// 로그아웃하기
	$("#logoutbtn").click(function() {

		alert("로그아웃되었습니다.");
		location.href = "../jsp/logout.jsp";	
		
	});
	
	
	
});