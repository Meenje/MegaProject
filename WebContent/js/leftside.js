$(function(){
	$.ajax({
		url : "http://localhost:8080/bigproject2/jsp/leftside.jsp",
		dataType : "json",
		success : function(result) {
			$(result).each(function(i, book){
				if(i==0){
				$("#div-gangnam").html("<img src=" + book.img + " style='height: 180px; width: 130px; display: block;'>"
						 + "<input type='hidden' id='isbn-gangnam' value=" + book.isbn + ">"
						 + "<a href='http://localhost:8080/bigproject2/lib/bookinfo.jsp?isbn=" + book.isbn + "&name=" + book.name +"' class='card-link'>" + book.name + "</a>");
				} else {
				$("#div-gaepo").html("<img src=" + book.img + " style='height: 180px; width: 130px; display: block;'>"
						 + "<input type='hidden' id='isbn-gangnam' value=" + book.isbn + ">"
						 + "<a href='http://localhost:8080/bigproject2/lib/bookinfo.jsp?isbn=" + book.isbn + "&name=" + book.name +"' class='card-link'>" + book.name + "</a>");
				}
			});	

		}
	});
});