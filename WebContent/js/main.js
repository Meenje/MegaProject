function showPopup() { window.open("../lib/signup.jsp", "a", "width=400, height=550, left=800, top=150"); }

$(function () {
	
	$('ul.tabs li').click(function () {
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#" + tab_id).addClass('current');
	})



	$("#atag1").on("click", function () {
		$("#timg").empty();
		$.ajax({
			url : "http://localhost:8888/bigproject2/jsp/Besttotal.jsp",
			dataType : "json",
			success : function(result) {
				
				for(var i = 0; i < 5; i++){
					
					var img = result[i].img;
					var isbn = result[i].isbn;
					var name = result[i].name;
						
					
					$("#timg").append(
							"<td><a href =../lib/book.html?isbn="+isbn+"&name="+name+"><img src=" + img + " width='160' height='215'>" + name +"</a></td>");
				}
			}

	});
	});
	
	$("#nationalcb").on("change", function () {
		//값을 가져옴
		var gender = $(".nationalgender:checked").val();
		var age = $(".autocomplete").val();
		//jsp 실행
		
		//json실행
		$("#timg").empty();
		$.ajax({
			url : "http://localhost:8888/bigproject2/jsp/BestGA.jsp",
			success : function(result) {
				//jsp에 테이블 가져와서 끼고
				for(var i = 0; i < 5; i++){
					
					var img = result[i].img;
					var isbn = result[i].isbn;
					var name = result[i].name;
						
					
					$("#timg").append(
							"<td><a href =../lib/book.html?isbn="+isbn+"&name="+name+"><img src=" + img + " width='160' height='215'>" + name +"</a></td>");
				}
			}

	});
	});
	

	
});

  