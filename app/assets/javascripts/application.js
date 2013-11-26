//= require jquery

$(function() {
	$(".flash").delay(500).fadeIn('normal', function() {
		$(this).delay(2500).fadeOut();
	});
});

$(function() {
	$(".bad-flash").delay(500).fadeIn('normal', function() {
		$(this).delay(2500).fadeOut();
	});
});

