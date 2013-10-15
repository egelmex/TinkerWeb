---
layout: default
title: Photos
categories: []
tags: []
status: publish
type: page
published: true 
postload: photos.js
sitemap:
    changefreq: monthly
---
<style>
.gallery img {
	width: 240px;
}
</style>
{% if page.published == true %}
{% span 12 %}
<div class="text-center" style="width:100%">
{% flickr_set 72157635467790779 %}
</div>
{% endspan %}
{% endif %}
