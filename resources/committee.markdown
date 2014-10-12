---
layout: default 
title: Your Committee
categories: []
tags: []
status: draft
postload: photos.js
type: page
sitemap:
    changefreq: monthly
---

<style>

section figure {
    float: left;
    clear: both;
    
    position: relative;
    overflow: auto;
    display: inline-block;
    
    margin: 0 auto;
    padding: 30px 0 0 0;
    font-size: 15px;
}

section figure img {
    vertical-align: bottom;
}

section figure figcaption {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    
    background: rgba(0,0,0,0.7);
    text-align: center;
    color: #fff; 
    padding: 10px;
}

section#container {
	margin-right: auto;
	margin-left: auto;
}

@media (max-width: 768px) {
section figure img {
	width: 100%;
}

}


</style>

#The Committee#
These are the people who run the society and make decisions on what to do. If you want to make a suggestion or contact the committee, please email committee @ tinkersoc.org

<section id="container" class=".col-md-12">
{% row %}
{% for committeemem in site.data.committee.current_committee %}

<figure class="item">
{% picture face {{committeemem.image}} %}
<figcaption>

{% if committeemem.url == null %}
<strong>{{ committeemem.comment }} - {{committeemem.name}}</strong>
{% else %}
<strong>{{ committeemem.comment }} - <a href="{{committeemem.url}}">{{committeemem.name}}</a></strong>
{% endif %}
</figcaption>
</figure>

{% endfor %}
</section>

{% endrow %}

##The Fallen##

These brave men and women gave up their free time and sanity for TinkerSoc and
have since moved on to pastures green. They should not be forgotten.

{% for fallen in site.data.committee.the_fallen %}
{% if fallen.url == null %}
* <strong>{{fallen.name}}</strong> – {{fallen.comment}}
{% else %}
* <strong><a href="{{fallen.url}}">{{fallen.name}}</a></strong> – {{fallen.comment}}
{% endif %}

{% endfor %}
