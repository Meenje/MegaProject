/* select box jquery */
$(function () {
	$('.selectLibrary').on('change', function () {
		var selected_options = $('.selectLibrary').map(function () {
			return this.value
		}).get();

		$('.selectLibrary option').each(function (index) {
			$(this).prop('disabled', $.inArray($(this).val(), selected_options) != -1);
		});
	});
	
	$("input:checkbox[name='total']").change(function(){
        if($("input:checkbox[name='total']").is(":checked")){
			// 체크박스 체크
			$("#cbdiv").css("display","none");
        }else{
			// 체크박스 체크 해제!
			$("#cbdiv").css("display","inherit");
        }
    });

	$("input:checkbox[name='interesting']").click(function () {
		var cntEPT = $("input:checkbox[name='interesting']:checked").length;
		if (cntEPT > 3) {
			alert('최대 3개까지 선택 가능합니다.')
			$(this).prop('checked', false);
		}
	});
});
