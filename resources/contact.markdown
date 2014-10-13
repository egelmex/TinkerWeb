---
layout: default
title: Contact Us
categories: []
tags: []
status: publish
type: page
published: true
sitemap:
    changefreq: monthly
---

# Contact Us #

You can stay in touch via [Twitter](http://twitter.com/tinkersoc), [Facebook](http://facebook.com/TinkerSoc) and Email.

{% span 4 %}
{% capture follow %}
## Follow us ##
Follow us on twitter and facebook for last minute updates!

We also post links to interesting hacky/tinkery things we've found around the internet!

If you'd like us to follow you on twitter (we'd like to follow you!), then direct message us.
{% endcapture %}
{{ follow | markdownify }}
<!-- Twitter Follow button -->
<a href="https://twitter.com/tinkersoc" class="twitter-follow-button" data-show-count="false">Follow @tinkersoc</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>

<!-- Facebook Like button -->
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<div class="fb-follow" data-href="https://www.facebook.com/TinkerSoc" data-width="220" data-show-faces="false"></div>
{% endspan %}

{% span 4 %}
{% capture email %}
## Email us ##

If you'd like to contact us directly, you can use the following email adresses to reach the comittee:

* Matthew @ tinkersoc . org -- Matthew Prentice, President
* Christina @ tinkersoc . org -- Christina Nutton, Treasurer
* Jodie @ tinkersoc . org -- Jodie Perry, Secretary

or, if you want to reach us all at once please use:

* committee @ tinkersoc . org

(Don't forget to remove the spaces if you copy/paste the addresses!)
{% endcapture %}
{{ email | markdownify }}
{% endspan %}

{% span 4 %}
{% capture mail_list %}
## Mailing List ##
We have a mailing list in which we go through plans for the coming events, and will contact you via for large special events, like trips and so on.

To sign up to receive latest announcements please contact committee '@' tinkersoc.org
{% endcapture %}
{{ mail_list | markdownify }}
{% endspan %}
