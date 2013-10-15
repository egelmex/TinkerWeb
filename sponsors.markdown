---
layout: default 
title: Sponsors
categories: []
tags: []
status: publish
type: page
published: true
sitemap:
    changefreq: monthly
---
{% span 8 col-md-offset-2 %}
{% capture text %}
# TinkerSoc's Sponsors #
We would like to thank those people/companies who have kindly sponsored TinkerSoc over the year! Their help has meant we have been able to do more awesome projects than we could otherwise consider.
{% endcapture %}
{{ text | markdownify }}

{% row text-center %}
{% span 4 col-sm-6 col-xs-12 %}
{% picture bnk.png %}
<!-- col1 -->
{% endspan %}

{% span 4 col-sm-6 col-xs-12 %}
{% picture iet.jpg %}
<!-- col2 -->
{% endspan %}

{% span 4 col-sm-6 col-xs-12 %}
{% picture weller.jpg %}
<!-- col2 -->
{% endspan %}
{% endrow %}
{% endspan %}