
$(function() {
	$("#signbtn").click(function() {
		if($("#memberid").val().length < 6){
			alert("아이디를 6글자 이상 입력하세요");
		} else if($("#confirmdiv").text()!="패스워드가 같습니다.") {
			alert("패스워드가 서로 같지 않습니다.");
		} else if($("#name").val().length==0 || $("#tel").val().length==0 || $("#email").val().length==0 || $("#password").val().length==0) {
			alert("빈칸을 모두 채워넣으세요.");
		}
		else {
		var id = $("#memberid").val();
		var name = $("#name").val();
		var tel = $("#tel").val();
		var email = $("#email").val();
		var pw = $("#password").val();
		
		var birth = $("#MoveInDate").val();
		
		var gender = $("input:radio[name='gender']").val();
		
		var subject = "90000000000";
		if ($("input:checkbox[name='total']").is(":checked")) {
			subject = "91111111111";
		} else {
			$("input:checkbox[name='interesting']:checked").each(function() {
				subject = parseInt(subject) + parseInt($(this).val());
			});
		}		
		if(subject=="90000000000"){
			subject = "91111111111";
		}
		subject = subject.toString().substring(1, subject.length);
		
		var library = parseInt($("#sb1 option:selected").val()) + parseInt($("#sb2 option:selected").val()) + parseInt($("#sb3 option:selected").val());
		if(library == 60000000000000){
			library = 61111111111111;
		}
		
		var library2 = library.toString();
		var library3 = library2.substring(1, 14);
		
		
		$.ajax({
			url : "http://localhost:8080/bigproject2/jsp/signup.jsp",
			data : {
				id : id,
				pw : pw,
				name : name,
				tel : tel,
				email : email,
				age : birth,
				gender : gender,
				subject : subject,
				library : library3,
			},
			success : function() {
				self.close();
				opener.alert("회원가입이 성공적으로 완료되었습니다.");
			}
		});
		}
	});

	$("#memberid").keyup(function() {
        if($("#memberid").val().length == 0){
        	$("#iddiv").text("");
        } else if($("#memberid").val().length < 6){
        	$("#iddiv").text("6글자 이상 입력해야합니다.");
        } else {
        	var id = $("#memberid").val();
        	$.ajax({
    			url : "http://localhost:8080/bigproject2/jsp/checkid.jsp",
    			data : {
    				id : id,
    			},
    			success : function(result) {
    				$("#iddiv").html(result);
    			}
    		});
        }
    });
	
	$("#confirm").keyup(function() {
		if($("#confirm").val().length == 0){
			$("#confirmdiv").text("패스워드 확인은 필수 입니다.");
		} else if($("#confirm").val() != $("#password").val()) {
			$("#confirmdiv").text("패스워드가 다릅니다.");
		} else {
			$("#confirmdiv").text("패스워드가 같습니다.");
		}
	});
	
});



