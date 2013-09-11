---
layout: default
title: Photos
categories: []
tags: []
status: publish
type: page
published: true
meta:
  _wp_page_template: full-width-page.php
  _wpas_done_all: '1'
  _edit_last: '12'
---
<div class="text-center" style="width:100%">
{% flickr_set 72157635467790779 %}
</div>

<script>
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
	console.log(color)
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
</script>
