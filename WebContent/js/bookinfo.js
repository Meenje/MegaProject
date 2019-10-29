
$(document).ready(function() {
		var isbn = $("#viewisbn").val();
		var name = $("#bname").val();

		$("#graph").empty();
		
		
		$.ajax({
			url : "http://localhost:8080/bigproject2/jsp/bookpossession.jsp",
			dataType: "json",
			data : {
				isbn : isbn,
				name : name,
			},
			success : function(result) {
				
					var resultarr = [result.l1,result.l2,result.l3,result.l4,result.l5,result.l6,
						 result.l7, result.l8,result.l9,result.l10,result.l11,result.l12,result.l13]
		
					var resultltname = ["강남구립논현도서관","강남구립대치도서관", "강남구립도곡정보문화도서관", "강남구립못골도서관", "강남구립못골한옥어린이도서관",
										"강남구립역삼도서관", "강남구립역삼푸른솔도서관", "강남구립정다운도서관", "강남구립즐거운도서관", "강남구립청담도서관",
										"강남구립행복도서관", "강남도서관", "개포도서관"]
					
					for (var i = 0; i <13; i++) {
						
						if(resultarr[i] == 1){
							$("#libname").append(resultltname[i] + "  |  ");
						}
					}	
				
			}
	});	
		
		$.ajax({
			url : "http://localhost:8080/bigproject2/jsp/drawgraph.jsp",
			dataType: "json",
			data : {
				isbn : isbn,
				name : name,
			},
			success : function(result) {

				     //X,Y 쌍으로 배열의 형태로 차례대로 값을 넣습니다.
					var data = [['2018/09',result.m09],['2018/10',result.m10],['2018/11',result.m11],['2018/12',result.m12],
								['2019/01',result.m01],['2019/02',result.m02],['2019/03',result.m03],['2019/04',result.m04],
								['2019/05',result.m05],['2019/06',result.m06],['2019/07',result.m07],['2019/08',result.m08]];
					
					var plot = $.jqplot('graph', [data],{  
				          axes:{
				        	  xaxis:{
				                  // 날짜 형태로 입력을 하기위해서는 Date형식의 Renderer을 사용합니다.
				                  renderer:$.jqplot.DateAxisRenderer,
				                  tickOptions:{ // 축에관한 옵션                    
				                      // 입력된 값이 날짜형태로 인식되기 위해서 format 형식을 정해주고 입력값도
				                      // yyyy/mm/dd 형식으로 입력해야만 정상적으로 나타납니다.
				                        formatString:'%y년/%m월'
				                  } 
				              }
				          }
				    });
				     
			
			}
			
		});	
		
});
	    


