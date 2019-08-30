$(document).on('change','.q_type', function(){
	$('.check_box').prop("checked",false);
});
$(document).on('click', '.check_box', function() {
//debugger
question = $(this).parents('.question');
q_type = $(question).children().find('.q_type');
//q_type = $('#q_type option:selected').text();
 if(q_type.val() == 'MCQ' || q_type.val()== 'True/False')
 	{
		check_boxes = $(question).children().find('.check_box');
		check_boxes.each(function() {
 		$(this).prop("checked", false);
 		})

 		$(this).prop("checked", true)
	}
// alert('hi')
 })
