
function bindTimer(dom) {
	 var timer = $(dom).startTimer({
     onComplete: function(){
     	// debugger
     	window.location.href = $('.submit_test').attr('href');
     }
   });
 changeNextLink(timer);
}

function changeNextLink(timer) {
	//alert("okk")
 $('.submit').on('click', function() {
   $('.duration-class').val(timer.data('timeLeft'));
   
 });
}
