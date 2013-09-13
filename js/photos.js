var mOn = false;

$(window).load( function(){ 
var $container = $('#container');
// initialize
$container.masonry({
  itemSelector: '.item',
  "isFitWidth": true
});
mOn = true
});

$(window).resize(function(){	
	var $container = $('#container');
	var color = $(".item").css("border-color")
	if (color == "rgb(255, 255, 255)" && mOn) {
		$container.masonry('destroy')
		mOn = false
	} else if (color != "rgb(255, 255, 255)" && !mOn) {
		$container.masonry({
		  itemSelector: '.item',
		  "isFitWidth": true
		});
		mOn = true
	
	}
});
