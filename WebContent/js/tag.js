$(function() {
	$(".bookrows").on("click",function() {
		var isbn = $(this).children(".isbns").text();
		var name = $(this).children(".names").text();
		location.href = "http://localhost:8080/bigproject2/lib/bookinfo.jsp?isbn=" + isbn + "&name=" + name;
	});
});
