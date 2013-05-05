
// $(document).ready(function() {
	
//   $(function() {
//       $('ul.nav a').bind('click',function(event){
//           var $anchor = $(this);
          
//           if you want to use one of the easing effects:
//           $('html, body').stop().animate({
//               scrollLeft: $($anchor.attr('href')).offset().left
//           }, 1500,'easeInOutExpo');
           
//           $('html, body').stop().animate({
//               scrollLeft: $($anchor.attr('href')).offset().left - 90
//           }, 750);
//           event.preventDefault();
//       });
//   });


	$(function(){

		$("body").mousewheel(function(event, delta) {
			this.scrollLeft -= (delta * 30);
			event.preventDefault();
		});   
	})

  // $(function(){
  //     $("#email_subscription_email").focus();
  // });

});