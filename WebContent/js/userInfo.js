
$(function() {
	

	
	// 회원정보 수정하기
	$("#mypagebtn").click(function() {
		
		 window.open("../jsphome/userInfo.jsp", "a", "width=400, height=550, left=800, top=150"); 	
		
	});
	
	$("#updatebtn").click(function() {
		location.href = "../jsp/update.jsp";
		/*$.ajax({
			url : "http://localhost:8080/bigproject2_5/jsp/update.jsp",
			
			
			
			success : function(result) {
				
				//alert(result);
				console.log(result);
				
				if(result == 1){
					alert("수정완료");
					  location.href = "../jsphome/main.jsp";
					
				}else {
					alert("패스워드 틀림");
					return false;
				}
				
			
				
			}
		});*/
		
			 
		  
	      
	   
		
		
	});
	
});