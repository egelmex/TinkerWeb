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
$(window).load( function(){ 
var $container = $('#container');
// initialize
$container.masonry({
  itemSelector: '.item',
});
});
</script>
