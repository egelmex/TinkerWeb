---
layout: post
title: A HP Microserver Media Center build.
categories:
- Howtos 
tags: []
status: publish
type: post
published: false 
---

This is going to be a quick howto on setting up a media server using one of the
awesome microservers.  If you havn't heard of the Mircroserver, it's a great
little low power box produced by HP and nearly always has a £100 rebate offer
running making it cheep as chips.

For my setup I used Arch Linux, and some of these instuctions will assume some
familiarity with Arch Linux.  This setup should be just as easy on any of the
major Linux's or you could try XBMCbuntu which is designed to work out of the
box.

## Parts ##

1. HP Microserver (£120 after rebate)
2. Graphics Cards (£20)
3. WMC Remote (£17)
4. HardDriver 3Tb (£90)
5. Optioanlly a Memory Stick (4+Gb).

### Choice of Graphics Card ###

Choice of graphics card is up to you, but when shopping around you need to look
for.

 * Hardware Video Decoding.
 * Low profile.
 * Single slot width.
 * Low noise.
 * HMDI Output.

I have built two of these Machines so far, and have used a Zotac GT 610 Synergy
Edition in one and the other around a nvidia GT 520.  The GT610 is basiclly just
a rebadged GT520.

Note: I first tried a silent graphics card which claimed to be single slot,
however the depth of the heatsink still meant it didn't fit, because the 16x
slot is so close to the edge of the case.

## Hardware Setup ##

Whilst installing the Hardware you will realise just how much effort has gone
intot the design of the microserver case.  All screws use an allen key, which
has a handy storage clip inside the case.  Likewise all the spare screws you
need are screwed intot the front door so they don't get lost. 

### Installing the graphics card ###

This is possibly the most fiddly part of the build but it's probably worth
isntallign the graphics card first as to do so you will need to remove the
motherboard from the case.

First you will need to remove the backing plate that comes with the graphics
card and swap it for the low profile versions that should have been shipped
with it.

### Installing the Optical Drive ###

The Microserver is avliable bare bones, or optionally bundled with a DVD
burner.  If you have a spare SATA DVD drive about you can save yourself a few
pounds by using that, but either way the drive will need installing.

 1. Connect Molex -> Sata power adapter.
 2. Route Sata cable.
 3. Install Rail Screws into Optical Drive
 4. Intall Drive.


### Install the HDD ###

Note: Though the mircro server uses caddies, the disk drives are NOT hot
swappable.

### Install the Memory Stick (Optional) ###

The Microserver included an internal USB socket, this is very handy for a
memory stick to use as your OS disk, allowing you to maximise the storage
avaliable for your media.

If you chose to install your OS onto a memory stick there are a few things to
take into account.
 1. SWAP should not be mounted onto the stick as this will decrese it's life.
 1. /var should probabbly also be installed else where as it get's frequent
    read/writes. 

## Software Setup ##

I am goign to assume you have gone with a nvidia card, like the one I used,
however if you chose a AMD card you will need to adjust these commands to work. 

First step... Install Arch Linux (I did say some familiarity with Arch Linux
would be needed!)

Next up you need to install

 * X
 * Graphics Drivers
 * XBMC

{% highlight bash %}
# pacman -S xorg-server xorg-apps nvidia xbmc
{% endhighlight %}

A restart is needed to switch to the nvidia drivers 

Next up the XBMC service needs to be enabled/started.  For those of you less
familier with systemctl, enable/disable are used to control if a service is
started a boot, whilst start/stop/restart are used to for services to
start/stop.

{% highlight bash %}
# systemctl enable xbmc
# systemctrl start xbmc
{% endhighlight %}

If all goes well at this point. XBMC should boot up and we are ready to set up
our data sources. 
