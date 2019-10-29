function showPopup() { window.open("../lib/signup.jsp", "a", "width=400, height=550, left=800, top=150"); }

$(function () {
	
	$('ul.tabs li').click(function () {
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#" + tab_id).addClass('current');
	})


	// 메인_강남전체
	$("#atag1").ready(function () {
		$("#timg").empty();
		$.ajax({
			url : "http://localhost:8080/bigproject2/mainGF/Besttotal.jsp",
			dataType : "json",
			success : function(result) {
				for(var i = 0; i < 5; i++){
					var img = result[i].img;
					var isbn = result[i].isbn;
					var name = result[i].name;
					$("#timg").append(
							"<td><a href =../lib/bookinfo.jsp?isbn="+isbn+"&name="+name+"><img src=" + img + " width='160' height='215'>" + name +"</a></td>");
				}
			}
		});
	});
	
	$("#atag1").on("click", function () {
		$("#timg").empty();
		$.ajax({
			url : "http://localhost:8080/bigproject2/mainGF/Besttotal.jsp",
			dataType : "json",
			success : function(result) {
				for(var i = 0; i < 5; i++){
					var img = result[i].img;
					var isbn = result[i].isbn;
					var name = result[i].name;
					$("#timg").append(
							"<td><a href =../lib/bookinfo.jsp?isbn="+isbn+"&name="+name+"><img src=" + img + " width='160' height='215'>" + name +"</a></td>");
				}
			}
		});
	});
	
	// 메인_강남연령
	$("#atag2").on("click", function () {
		$("#aimg").empty();
		$.ajax({
			url : "http://localhost:8080/bigproject2/mainGF/Bestage.jsp",
			dataType : "json",
			success : function(result) {
				for(var i = 0; i < 5; i++){
					var img = result[i].img;
					var isbn = result[i].isbn;
					var name = result[i].name;
					$("#aimg").append(
							"<td><a href =../lib/bookinfo.jsp?isbn="+isbn+"&name="+name+"><img src=" + img + " width='160' height='215'>" + name +"</a></td>");
				}
			}
		});
	});
	
	// 메인_강남성별
	$("#atag3").on("click", function () {
		$("#gimg").empty();
		$.ajax({
			url : "http://localhost:8080/bigproject2/mainGF/Bestgender.jsp",
			dataType : "json",
			success : function(result) {
				for(var i = 0; i < 5; i++){
					var img = result[i].img;
					var isbn = result[i].isbn;
					var name = result[i].name;
					$("#gimg").append(
							"<td><a href =../lib/bookinfo.jsp?isbn="+isbn+"&name="+name+"><img src=" + img + " width='160' height='215'>" + name +"</a></td>");
				}
			}
		});
	});
	
	// 메인_강남주제별
	$("#atag4").on("click", function () {
		$("#simg").empty();
		$.ajax({
			url : "http://localhost:8080/bigproject2/mainGF/Bestsubject.jsp",
			dataType : "json",
			success : function(result) {
				for(var i = 0; i < 5; i++){
					var img = result[i].img;
					var isbn = result[i].isbn;
					var name = result[i].name;
					$("#simg").append(
							"<td><a href =../lib/bookinfo.jsp?isbn="+isbn+"&name="+name+"><img src=" + img + " width='160' height='215'>" + name +"</a></td>");
				}
			}
		});
	});
	
	// 강남 인기 급상승
	$("#rimg").ready(function () {
		$.ajax({
			url : "http://localhost:8080/bigproject2/mainGF/bookrank.jsp",
			dataType : "json",
			success : function(result) {
				for(var i = 0; i < 5; i++){
					var img = result[i].img;
					var isbn = result[i].isbn;
					var name = result[i].name;
					$("#rimg").append(
							"<td><a href =../lib/bookinfo.jsp?isbn="+isbn+"&name="+name+"><img src=" + img + " width='160' height='215'>" + name +"</a></td>");
				}
			}
		});
	});
	
	// 전국인기도서
	$("#nimg").ready(function () {
		var gender = $(".nationalgender:checked").val();
		var age = $("#nationalcb option:selected").val();
		$.ajax({
			url : "http://localhost:8080/bigproject2/mainGF/Bestga.jsp",
			dataType : "json",
			data : {
				gender : gender,
				age : age,
			},  
			success : function(result) {
				for(var i = 0; i < 3; i++){
					var img = result[i].img;
					var isbn = result[i].isbn;
					var name = result[i].name;
					$("#nimg").append(
							"<td><a href =../lib/bookinfo.jsp?isbn="+isbn+"&name="+name+"><img src=" + img + " width='160' height='215'>" + name +"</a></td>");
				}
			}
		});
	});
	
	// radio 버튼 클릭 이벤트 
	$("input:radio[name=gender]").click(function(){
	        $("#nimg").empty();
	        var gender = $(".nationalgender:checked").val();
			var age = $("#nationalcb option:selected").val();
			$.ajax({
				url : "http://localhost:8080/bigproject2/mainGF/Bestga.jsp",
				dataType : "json",
				data : {
					gender : gender,
					age : age,
				}, 
				success : function(result) {
					
					for(var i = 0; i < 3; i++){
						
						var img = result[i].img;
						var isbn = result[i].isbn;
						var name = result[i].name;
							
						$("#nimg").append(
								"<td><a href =../lib/bookinfo.jsp?isbn="+isbn+"&name="+name+"><img src=" + img + " width='160' height='215'>" + name +"</a></td>");
					}
				}
			});
	});

	
	$("#nationalcb").on("change", function () {
		$("#nimg").empty();
		var gender = $(".nationalgender:checked").val();
		var age = $("#nationalcb option:selected").val();
		$.ajax({
			url : "http://localhost:8080/bigproject2/mainGF/Bestga.jsp",
			dataType : "json",
			data : {
				gender : gender,
				age : age,
			},
			success : function(result) {
				for(var i = 0; i < 3; i++){
					var img = result[i].img;
					var isbn = result[i].isbn;
					var name = result[i].name;
					
					$("#nimg").append(
							"<td><a href =../lib/bookinfo.jsp?isbn="+isbn+"&name="+name+"><img src=" + img + " width='160' height='215'>" + name +"</a></td>");
				}
			}

		});
	});
	
	// 신규도서
	$("#nbimg").ready(function () {
		$("#nbimg").empty();
		var lname = $("#example option:selected").val();
		
		$.ajax({
			url : "http://localhost:8080/bigproject2/mainGF/Newbook.jsp",
			dataType : "json",
			data : {
				lname : lname,
			},
			success : function(result) {
				for(var i = 0; i < 3; i++){
					var img = result[i].img;
					var isbn = result[i].isbn;
					var name = result[i].name;
					$("#nbimg").append(
							"<td><a href =../lib/bookinfo.jsp?isbn="+isbn+"&name="+name+"><img src=" + img + " width='160' height='215'>" + name +"</a></td>");
				}
			}
		});
	});
	
	$("#example").on("change", function () {
		
		$("#nbimg").empty();
		var lname = $("#example option:selected").val();
		
		$.ajax({
			url : "http://localhost:8080/bigproject2/mainGF/Newbook.jsp",
			dataType : "json",
			data : {
				lname : lname,
			},
			
			success : function(result) {
				
				for(var i = 0; i < 3; i++){
					
					var img = result[i].img;
					var isbn = result[i].isbn;
					var name = result[i].name;
						
					$("#nbimg").append(
							"<td><a href =../lib/bookinfo.jsp?isbn="+isbn+"&name="+name+"><img src=" + img + " width='160' height='215'>" + name +"</a></td>");
				}
			}

		});
	});
	
});

  