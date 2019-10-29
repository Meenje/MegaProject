$(document).ready(function() {
	
	$("#btn-ontherun").on("click",function() {
		var gender = $(".sex-radio:checked").val();
		var age = $(".age-radio:checked").val();
		var subject = $(".thema-radio:checked").val();
		$.ajax({
			url : "http://localhost:8080/bigproject2/jsp/bookontherun.jsp",
			dataType : "json",
			data : {
				gender : gender,
				age : age,
				subject : subject,
			},
			success : function(result) {
				$(".result").html("<div class='table-container' style='background-color: floralwhite; border-radius: 0.6rem; height: 540px'>"
			            +    "<div style='grid-area: 1 / 1 / 2 / 2; margin: 10px;'>"
			            +        "<table class='rs-tb' id='1st-tb'>"
			            +            "<tr class='tr-1'>"
			            +                "<td rowspan='3' id='td-img1'></td>"
			            +                "<td class='td-isbn'><input type='hidden' class='hiddenisbns' id='hiddenisbn1' value='1'>도서명</td>"
			            +                "<td colspan='3' id='td-name1' class='td-name'></td>"
			            +            "</tr>"
			            +            "<tr>"
			            +                "<td>저자</td>"
			            +                "<td id='td-writer1'></td>"
			            +                "<td>주제분류</td>"
			            +                "<td id='td-subject1'></td>"
			            +            "</tr>"
			            +             "<tr>"
			            +                "<td>출판사</td>"
			            +                "<td id ='td-company1'></td>"
			            +                "<td>출판년도</td>"
			            +                "<td id='td-pyear1'></td>"
			            +           "</tr>"
			            +       "</table>"
			            +    "</div>"
			            +   "<div style='grid-area: 1 / 2 / 2 / 3; margin: 10px;'>"
			            +        "<table class='rs-tb' id='2nd-tb'>"
			            +            "<tr class='tr-1'>"
			            +                "<td rowspan='3' id='td-img2'></td>"
			            +                "<td class='td-isbn'><input type='hidden' class='hiddenisbns' id='hiddenisbn2' value='2'>도서명</td>"
			            +                "<td colspan='3' id='td-name2' class='td-name'><input type='hidden' class='hiddenisbn'></td>"
			            +            "</tr>"
			            +            "<tr>"
			            +                "<td>저자</td>"
			            +                "<td id='td-writer2'></td>"
			            +                "<td>주제분류</td>"
			            +                "<td id='td-subject2'></td>"
			            +            "</tr>"
			            +             "<tr>"
			            +                "<td>출판사</td>"
			            +                "<td id ='td-company2'></td>"
			            +                "<td>출판년도</td>"
			            +                "<td id='td-pyear2'></td>"
			            +           "</tr>"
			            +       "</table>"
+			                "</div>"
+			                "<div style='grid-area: 2 / 1 / 3 / 2; margin: 10px;'>"
+			                    "<table class='rs-tb' id='3rd-tb'>"
+			                        "<tr class='tr-1'>"
+			                            "<td rowspan='3' id='td-img3'></td>"
+			                            "<td class='td-isbn'><input type='hidden' class='hiddenisbns' id='hiddenisbn3' value='3'>도서명</td>"
+			                            "<td colspan='3' id='td-name3' class='td-name'><input type='hidden' class='hiddenisbn'></td>"
+			                        "</tr>"
+			                        "<tr>"
+			                            "<td>저자</td>"
+			                            "<td id='td-writer3'></td>"
+			                            "<td>주제분류</td>"
+			                            "<td id='td-subject3'></td>"
+			                        "</tr>"
+			                        "<tr>"
+			                            "<td>출판사</td>"
+			                            "<td id='td-company3'></td>"
+			                            "<td>출판년도</td>"
+			                            "<td id='td-pyear3'></td>"
+			                        "</tr>"
+			                    "</table>"
+			                "</div>"
+			                "<div style='grid-area: 2 / 2 / 3 / 3; margin: 10px;'>"
+			                    "<table class='rs-tb' id='4th-tb'>"
+			                        "<tr class='tr-1'>"
+			                            "<td rowspan='3' id='td-img4'></td>"
+			                            "<td class='td-isbn'><input type='hidden' class='hiddenisbns' id='hiddenisbn4' value='4'>도서명</td>"
+			                            "<td colspan='3' id='td-name4' class='td-name'><input type='hidden' class='hiddenisbn'></td>"
+			                        "</tr>"
+			                        "<tr>"
+			                            "<td>저자</td>"
+			                            "<td id='td-writer4'></td>"
+			                            "<td>주제분류</td>"
+			                            "<td id='td-subject4'></td>"
+			                        "</tr>"
+			                        "<tr>"
+			                            "<td>출판사</td>"
+			                            "<td id='td-company4'></td>"
+			                            "<td>출판년도</td>"
+			                            "<td id='td-pyear4'></td>"
+			                        "</tr>"
+			                    "</table>"
+			                "</div>"
+			                "<div style='grid-area: 3 / 1 / 4 / 2; margin: 10px;'>"
+			                    "<table class='rs-tb' id='5th-tb'>"
+			                        "<tr class='tr-1'>"
+			                            "<td rowspan='3' id='td-img5'></td>"
+			                            "<td class='td-isbn'><input type='hidden' class='hiddenisbns' id='hiddenisbn5' value='5'>도서명</td>"
+			                            "<td colspan='3' id='td-name5' class='td-name'><input type='hidden' class='hiddenisbn'></td>"
+			                        "</tr>"
+			                        "<tr>"
+			                            "<td>저자</td>"
+			                            "<td id='td-writer5'></td>"
+			                            "<td>주제분류</td>"
+			                            "<td id='td-subject5'></td>"
+			                        "</tr>"
+			                        "<tr>"
+			                            "<td>출판사</td>"
+			                            "<td id='td-company5'></td>"
+			                            "<td>출판년도</td>"
+			                            "<td id='td-pyear5'></td>"
+			                        "</tr>"
+			                    "</table>"
+			                "</div>"
+			                "<div style='grid-area: 3 / 2 / 4 / 3; margin: 10px;'>"
+			                    "<table class='rs-tb' id='6th-tb'>"
+			                        "<tr class='tr-1'>"
+			                            "<td rowspan='3' id='td-img6'></td>"
+			                            "<td class='td-isbn'><input type='hidden' class='hiddenisbns' id='hiddenisbn6' value='6'>도서명</td>"
+			                            "<td colspan='3' id='td-name6' class='td-name'></td>"
+			                        "</tr>"
+			                        "<tr>"
+			                            "<td>저자</td>"
+			                            "<td id='td-writer6'></td>"
+			                            "<td>주제분류</td>"
+			                            "<td id='td-subject6'></td>"
+			                        "</tr>"
+			                        "<tr>"
+			                            "<td>출판사</td>"
+			                            "<td id='td-company6'></td>"
+			                            "<td>출판년도</td>"
+			                            "<td id='td-pyear6'></td>"
+			                        "</tr>"
+			                    "</table>"
+			                "</div>"
+			                "<div style='grid-area: 4 / 1 / 5 / 3; margin: 0 auto;'>"
+			                    "<div class='btn-toolbar' role='toolbar' aria-label='Toolbar with button groups'>"
+			                        "<div class='btn-group mr-2' role='group' aria-label='First group'>"
+			                            "<button type='button' class='btn btn-secondary btn-page active' value='1'>1</button>"
+			                            "<button type='button' class='btn btn-secondary btn-page' value='2'>2</button>"
+			                            "<button type='button' class='btn btn-secondary btn-page' value='3'>3</button>"
+			                        "</div>"
+			                    "</div>"
+			                "</div>"
+			            "</div>");
				
				$(".btn-page").on("click",function(){
					$(".btn-page").removeClass("active");
					$(this).addClass("active");
					if($(this).val()=="1"){
						$("#td-img1").html("<img src=" + bookarray[0][6] +  " width='80' height='140'>");
						$("#td-img2").html("<img src=" + bookarray[1][6] +  " width='80' height='140'>");
						$("#td-img3").html("<img src=" + bookarray[2][6] +  " width='80' height='140'>");
						$("#td-img4").html("<img src=" + bookarray[3][6] +  " width='80' height='140'>");
						$("#td-img5").html("<img src=" + bookarray[4][6] +  " width='80' height='140'>");
						$("#td-img6").html("<img src=" + bookarray[5][6] +  " width='80' height='140'>");
						
						$("#td-name1").html(bookarray[0][1]);
						$("#td-name2").html(bookarray[1][1]);
						$("#td-name3").html(bookarray[2][1]);
						$("#td-name4").html(bookarray[3][1]);
						$("#td-name5").html(bookarray[4][1]);
						$("#td-name6").html(bookarray[5][1]);
						
						$("#td-writer1").html(bookarray[0][2]);
						$("#td-writer2").html(bookarray[1][2]);
						$("#td-writer3").html(bookarray[2][2]);
						$("#td-writer4").html(bookarray[3][2]);
						$("#td-writer5").html(bookarray[4][2]);
						$("#td-writer6").html(bookarray[5][2]);
						
						$("#td-company1").html(bookarray[0][3]);
						$("#td-company2").html(bookarray[1][3]);
						$("#td-company3").html(bookarray[2][3]);
						$("#td-company4").html(bookarray[3][3]);
						$("#td-company5").html(bookarray[4][3]);
						$("#td-company6").html(bookarray[5][3]);
						
						$("#td-pyear1").html(bookarray[0][4]);
						$("#td-pyear2").html(bookarray[1][4]);
						$("#td-pyear3").html(bookarray[2][4]);
						$("#td-pyear4").html(bookarray[3][4]);
						$("#td-pyear5").html(bookarray[4][4]);
						$("#td-pyear6").html(bookarray[5][4]);
						
						$("#td-subject1").html(bookarray[0][5]);
						$("#td-subject2").html(bookarray[1][5]);
						$("#td-subject3").html(bookarray[2][5]);
						$("#td-subject4").html(bookarray[3][5]);
						$("#td-subject5").html(bookarray[4][5]);
						$("#td-subject6").html(bookarray[5][5]);
						
						$("#hiddenisbn1").val(bookarray[0][0]);
						$("#hiddenisbn2").val(bookarray[1][0]);
						$("#hiddenisbn3").val(bookarray[2][0]);
						$("#hiddenisbn4").val(bookarray[3][0]);
						$("#hiddenisbn5").val(bookarray[4][0]);
						$("#hiddenisbn6").val(bookarray[5][0]);
					} else if($(this).val()=="2"){
						$("#td-img1").html("<img src=" + bookarray[6][6] +  " width='80' height='140'>");
						$("#td-img2").html("<img src=" + bookarray[7][6] +  " width='80' height='140'>");
						$("#td-img3").html("<img src=" + bookarray[8][6] +  " width='80' height='140'>");
						$("#td-img4").html("<img src=" + bookarray[9][6] +  " width='80' height='140'>");
						$("#td-img5").html("<img src=" + bookarray[10][6] +  " width='80' height='140'>");
						$("#td-img6").html("<img src=" + bookarray[11][6] +  " width='80' height='140'>");
						
						$("#td-name1").html(bookarray[6][1]);
						$("#td-name2").html(bookarray[7][1]);
						$("#td-name3").html(bookarray[8][1]);
						$("#td-name4").html(bookarray[9][1]);
						$("#td-name5").html(bookarray[10][1]);
						$("#td-name6").html(bookarray[11][1]);
						
						$("#td-writer1").html(bookarray[6][2]);
						$("#td-writer2").html(bookarray[7][2]);
						$("#td-writer3").html(bookarray[8][2]);
						$("#td-writer4").html(bookarray[9][2]);
						$("#td-writer5").html(bookarray[10][2]);
						$("#td-writer6").html(bookarray[11][2]);
						
						$("#td-company1").html(bookarray[6][3]);
						$("#td-company2").html(bookarray[7][3]);
						$("#td-company3").html(bookarray[8][3]);
						$("#td-company4").html(bookarray[9][3]);
						$("#td-company5").html(bookarray[10][3]);
						$("#td-company6").html(bookarray[11][3]);
						
						$("#td-pyear1").html(bookarray[6][4]);
						$("#td-pyear2").html(bookarray[7][4]);
						$("#td-pyear3").html(bookarray[8][4]);
						$("#td-pyear4").html(bookarray[9][4]);
						$("#td-pyear5").html(bookarray[10][4]);
						$("#td-pyear6").html(bookarray[11][4]);
						
						$("#td-subject1").html(bookarray[6][5]);
						$("#td-subject2").html(bookarray[7][5]);
						$("#td-subject3").html(bookarray[8][5]);
						$("#td-subject4").html(bookarray[9][5]);
						$("#td-subject5").html(bookarray[10][5]);
						$("#td-subject6").html(bookarray[11][5]);
						
						$("#hiddenisbn1").val(bookarray[6][0]);
						$("#hiddenisbn2").val(bookarray[7][0]);
						$("#hiddenisbn3").val(bookarray[8][0]);
						$("#hiddenisbn4").val(bookarray[9][0]);
						$("#hiddenisbn5").val(bookarray[10][0]);
						$("#hiddenisbn6").val(bookarray[11][0]);
						
					} else{
						$("#td-img1").html("<img src=" + bookarray[12][6] +  " width='80' height='140'>");
						$("#td-img2").html("<img src=" + bookarray[13][6] +  " width='80' height='140'>");
						$("#td-img3").html("<img src=" + bookarray[14][6] +  " width='80' height='140'>");
						$("#td-img4").html("<img src=" + bookarray[15][6] +  " width='80' height='140'>");
						$("#td-img5").html("<img src=" + bookarray[16][6] +  " width='80' height='140'>");
						$("#td-img6").html("<img src=" + bookarray[17][6] +  " width='80' height='140'>");
						
						$("#td-name1").html(bookarray[12][1]);
						$("#td-name2").html(bookarray[13][1]);
						$("#td-name3").html(bookarray[14][1]);
						$("#td-name4").html(bookarray[15][1]);
						$("#td-name5").html(bookarray[16][1]);
						$("#td-name6").html(bookarray[17][1]);
						
						$("#td-writer1").html(bookarray[12][2]);
						$("#td-writer2").html(bookarray[13][2]);
						$("#td-writer3").html(bookarray[14][2]);
						$("#td-writer4").html(bookarray[15][2]);
						$("#td-writer5").html(bookarray[16][2]);
						$("#td-writer6").html(bookarray[17][2]);
						
						$("#td-company1").html(bookarray[12][3]);
						$("#td-company2").html(bookarray[13][3]);
						$("#td-company3").html(bookarray[14][3]);
						$("#td-company4").html(bookarray[15][3]);
						$("#td-company5").html(bookarray[16][3]);
						$("#td-company6").html(bookarray[17][3]);
						
						$("#td-pyear1").html(bookarray[12][4]);
						$("#td-pyear2").html(bookarray[13][4]);
						$("#td-pyear3").html(bookarray[14][4]);
						$("#td-pyear4").html(bookarray[15][4]);
						$("#td-pyear5").html(bookarray[16][4]);
						$("#td-pyear6").html(bookarray[17][4]);
						
						$("#td-subject1").html(bookarray[12][5]);
						$("#td-subject2").html(bookarray[13][5]);
						$("#td-subject3").html(bookarray[14][5]);
						$("#td-subject4").html(bookarray[15][5]);
						$("#td-subject5").html(bookarray[16][5]);
						$("#td-subject6").html(bookarray[17][5]);
						
						$("#hiddenisbn1").val(bookarray[12][0]);
						$("#hiddenisbn2").val(bookarray[13][0]);
						$("#hiddenisbn3").val(bookarray[14][0]);
						$("#hiddenisbn4").val(bookarray[15][0]);
						$("#hiddenisbn5").val(bookarray[16][0]);
						$("#hiddenisbn6").val(bookarray[17][0]);
					}
				});
				
				const bookarray = Array(18).fill(null).map(() => Array());
				$(result).each(function(i, book){
					bookarray[i].push(book.isbn);
					bookarray[i].push(book.name);
					bookarray[i].push(book.writer);
					bookarray[i].push(book.company);
					bookarray[i].push(book.pyear);
					bookarray[i].push(book.kdc);
					bookarray[i].push(book.img);
				});
				

				$("#td-img1").html("<img src=" + bookarray[0][6] +  " width='80' height='140'>");
				$("#td-img2").html("<img src=" + bookarray[1][6] +  " width='80' height='140'>");
				$("#td-img3").html("<img src=" + bookarray[2][6] +  " width='80' height='140'>");
				$("#td-img4").html("<img src=" + bookarray[3][6] +  " width='80' height='140'>");
				$("#td-img5").html("<img src=" + bookarray[4][6] +  " width='80' height='140'>");
				$("#td-img6").html("<img src=" + bookarray[5][6] +  " width='80' height='140'>");
				
				$("#td-name1").html(bookarray[0][1]);
				$("#td-name2").html(bookarray[1][1]);
				$("#td-name3").html(bookarray[2][1]);
				$("#td-name4").html(bookarray[3][1]);
				$("#td-name5").html(bookarray[4][1]);
				$("#td-name6").html(bookarray[5][1]);
				
				$("#td-writer1").html(bookarray[0][2]);
				$("#td-writer2").html(bookarray[1][2]);
				$("#td-writer3").html(bookarray[2][2]);
				$("#td-writer4").html(bookarray[3][2]);
				$("#td-writer5").html(bookarray[4][2]);
				$("#td-writer6").html(bookarray[5][2]);
				
				$("#td-company1").html(bookarray[0][3]);
				$("#td-company2").html(bookarray[1][3]);
				$("#td-company3").html(bookarray[2][3]);
				$("#td-company4").html(bookarray[3][3]);
				$("#td-company5").html(bookarray[4][3]);
				$("#td-company6").html(bookarray[5][3]);
				
				$("#td-pyear1").html(bookarray[0][4]);
				$("#td-pyear2").html(bookarray[1][4]);
				$("#td-pyear3").html(bookarray[2][4]);
				$("#td-pyear4").html(bookarray[3][4]);
				$("#td-pyear5").html(bookarray[4][4]);
				$("#td-pyear6").html(bookarray[5][4]);
				
				$("#td-subject1").html(bookarray[0][5]);
				$("#td-subject2").html(bookarray[1][5]);
				$("#td-subject3").html(bookarray[2][5]);
				$("#td-subject4").html(bookarray[3][5]);
				$("#td-subject5").html(bookarray[4][5]);
				$("#td-subject6").html(bookarray[5][5]);
				
				$("#hiddenisbn1").val(bookarray[0][0]);
				$("#hiddenisbn2").val(bookarray[1][0]);
				$("#hiddenisbn3").val(bookarray[2][0]);
				$("#hiddenisbn4").val(bookarray[3][0]);
				$("#hiddenisbn5").val(bookarray[4][0]);
				$("#hiddenisbn6").val(bookarray[5][0]);

				
				$(".rs-tb").on("click", function() {
					var name = $(this).children("tbody").children(".tr-1").children(".td-name").html();
					var isbn = $(this).children("tbody").children(".tr-1").children(".td-isbn").children(".hiddenisbns").val();
					location.href = "http://localhost:8080/bigproject2/lib/bookinfo.jsp?isbn=" + isbn + "&name=" + name;
				});
			}
		});
	});
});



