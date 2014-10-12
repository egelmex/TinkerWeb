TinkerSoc Website
=================

TinkerSoc uses a static website, built with [Jekyll](http://jekyllrb.com/),
which is a ruby gem for building static websites. Currently jekyll does not
work on Windows, and windows isn't a supported platform - so it is highly
recomended you run the build system on a *NIX platform.

## Pre-requisites

You will need:
- ruby (>=2.0.1)
- imagemagick
- mini_magick
	`gem install mini_magick`
- jekyll
	`gem install jekyll`



## Building the website

```shell
jekyll build -c _local.yml,config.yml
```


If you want to view the website in a webrowser too, then use

```shell
jekyll server -c _local.yml,config.yml
```
