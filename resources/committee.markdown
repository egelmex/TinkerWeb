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

{% row %}
<section id="container" class=".col-md-12">
<figure class="item" id="dan">
{% picture face committee/dan.jpg %}
<figcaption>
<strong>President - <a href="http://www.cs.kent.ac.uk/people/rpg/dk242/index.html">Daniel Knox</a></strong>
</figcaption>
</figure>

<figure class="item" id="matt">
{% picture face committee/matt.jpg %}
<figcaption>
<strong>Treasurer - <a href="http://theelectronicbyte.wordpress.com/">Matthew Prentice</a></strong>
</figcaption>
</figure>

<figure class="item" id="berni">
{% picture face committee/berni.jpg %}
<figcaption>
<strong>Secretary - Berni Cross</strong>
</figcaption>
</figure>

<figure class="item" id="simon">
{% picture face committee/simon.jpg %}
<figcaption>
DogsBody - <a href="http://graymalk.in/">Simon Moore</a>
</figcaption>
</figure>

<figure class="item" id="ben">
{% picture face committee/ben.jpg %}
<figcaption>
Mr CAD - Ben Adamson
</figcaption>
</figure>

<figure class="item" id="jordan">
{% picture face committee/jordan.jpg %}
<figcaption>
Wrong Uni Boy - Jordan Cook
</figcaption>
</figure>

<figure class="item" id="martin">
{% picture face committee/martin.jpg %}
<figcaption>
Mr BOOM - <a href="www.martinfaulkner.co.uk">Martin Faulkner</a>
</figcaption>
</figure>
</section>

{% endrow %}

##The Fallen##

These brave men and women gave up their free time and sanity for tinkersoc and
have since moved on to pastures green. They should not be forgotten.

* <strong><a href="http://omer.me/">Omer Kilic</a></strong> – Founder, President (2008/2009, 2009/2010)
* **Chris Roberts** – Founder, Vice-President (2008/2009, 2009/2010), President (2010/2011)
* **Emma Johnson** – Founder, Treasurer (2008/2009, 2009/2010, 2010/2011, 2011/2012)
* **Matt Medland** – Secretary (2009/2010), President(2011/2012)
* **Martin Ellis** - Secretary (2010/2011, 2011/2012)
* **Kezzy Robins** – Communications Officer (2010/2011)

{% capture jordan %}
{% picture face committee/jordan-silly.jpg %} 
{% endcapture %}

<script src="{{ site.url }}/assets/js/konami.js"></script>
<script>	 
var easter_egg = new Konami();
easter_egg.code = function() 
{ 			
  $("#jordan").html("{{ jordan | replace: '"', '\"' | strip_newlines }} <figcaption>Wrong Uni Boy - Jordan Cook</figcaption>");

  // Need to do something here to update the DOM, resizing the window
  //  appears to work, but that's obvs not something we can do

}
easter_egg.load();
</script>