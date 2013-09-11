---
layout: blog 
title: Raspberry Pi Arcade Machine
categories:
- Builds
tags: []
status: publish
type: post
published: true
---

# Contents #

* <a href="#1">Building the Cabinet</a>
 * <a href="#1a">Measurements</a>
 * <a href="#1b">Construction</a>
 * <a href="#1c">Decorating</a>
* <a href="#2">The control box</a>
 * <a href="#2a">Construction</a></li>
 * <a href="#2b">Mounting the controls</a>
* <a href="#3">Mounting the Screen</a>
 * <a href="#3a">The donor screen</a>
* <a href="#4">Configuring the Raspberry Pi</a>
 * <a href="#4a">RaspBian &amp; Hardware</a>
 * <a href="#4b">RetroPi</a>
 * <a href="#4c">The ROM's</a>
 * <a href="#4d">BackUp</a>

# Building the Cabinet #

## 1.a - Measurements &amp; Prep Work ##

{% span 6 pull-right %}
{% picture 2013-02-08-raspberry-pi-arcade-machine/AM1-a.jpg %}
<!-- test -->
{% endspan %}

The initial design was found at,
(http://chris.polymathic.net/cabinet/CAB-Model.pdf)
We changed the widths and a couple of the heights to make them more door friendly. We also adjusted a couple of things to allow for: the different thickness of plywood (1/2”) we were using, the caster wheel sizes (as the side and front panels work as skirts) and the control board design.

We first transferred the design to 3 sheets of 4’ x 8’ plywood. Each side of
the cabinet was put on its own sheet of plywood and the spare on each sheet was
used for the other panels (back, top, front etc.) To mark out we used the good
edges of the plywood as much as possible and worked from there. The diagram
below shows how we approached marking out the sides. Most of the other pieces
are just rectangles based on the measurements of the sides.


We then cut out all of the pieces. To do this we mainly used a circular saw
with a long piece of clamped metal as a guide; for the smaller corner pieces we
used a jigsaw. For the sides, we clamped both sheets of plywood together and
cut them at the same time. This saved marking out a second sheet of plywood and
made sure both pieces were as identical as possible. As each piece was cut it
was marked so that we knew what it was for. All pieces and edges were sanded
down.

## 1.b - Construction ##

{% span 6 pull-right %}
{% picture 2013-02-08-raspberry-pi-arcade-machine/AM1-b.jpg %}
<!-- need to fix this -->
{% endspan %}

To attach the pieces together we used 1”x1” ledgers. Tinkersoc members would
work out the length of ledger required and cut these from a length of 1”x1”
strip wood. These were glued where a joint was required and then countersunk
screws were used to securely fasten each piece. A diagram is shown below.

Countersinking is where you drill a hole for a screw and then using a
countersink drill bit so that the head of the screw can sit in the wood and run
flush with the outside. We filled these holes and sanded the whole thing down
for painting.

Construction took three nights. This was the usual format:

* Measuring out the length required for each joint.
* Marking the placement of each hole and regularly space them (and made sure that they ‘looked right’ with the alignment with the other side).
* Test that this was indeed correct by dummy running the pieces.
* Using a hand drill to make the hole and countersink it. Members were shown how to make a hole without breaking the other side when the bit emerges!
* Screwing in the holes to secure the ledger and the side pieces.

## 1.c - Decorating ##

We went for a retro theme with this build.

Using a general purpose filler we filled in all the edges and joints, as well
as the screw heads, and after leaving the filler to dry sanded the cabinet
down. We used a tin of white primer which was used as the base coat and
topcoat.. This was done by people volunteering between lectures in the Computer
Science foyer, and the Architecture workshop, here at the University. Once the
machine was primed, we designed and cut out some stencils with various well
known retro game figures, like Mario and space invaders.

We began painting these in one of the TinkerSoc sessions while the monitor
assembly was constructed, and it was also finished off by volunteers between
lectures. We noticed people becoming increasingly interested in the machine at
this point and had lots of fun explaining what it was and how it worked to
passing staff and students.

# 2 - The Control Box #

## .a - Construction ##

{% span 6 pull-right %}
{% picture 2013-02-08-raspberry-pi-arcade-machine/AM2-a.jpg %}
<!-- BAH -->
{% endspan %}

The control box is a simple box with the top pannel having a rounded lip.  A
controler layout from http://www.slagcoin.com/joystick/layout.html was used,
the exact one isn’t important.


## 2.b - Mounting the controls ##

For interfacing with the raspberry pi we used a joystick kit.  The buttons
connect directly to this board using the wiring looms provided, and then the
interface board connects to our Raspberry Pi with a usb cable.
http://www.ultracabs.co.uk/usb-2-joystick--22-button-arcade-control-kit-71-p.asp

# 3 - Mounting the Screen #

## 3.a - The donor screen ##

The donor screen was a 17 inch monitor from the CS department in the
university. We disassembled it, to remove the plastic bezel and surround, and
exposed the VESA mounts. Once we had done this, we had a bare panel to work
with, and reframe into a piece of ply.

The appropriate sized hole was cut into the panel that would become the front
of the machine, and we placed blocks around the screen to both provide vertical
support for the screen and allow us to place a board across the back to screw
through into the VESA mount, to give lateral support.

We carefully marked where each block would go, naming them corresponding to top
bottom, left and right, and screwed each in place using screws which would both
grip into the plywood front, and not be visible on the other side.

To get the 4 points that the VESA mount needed to be drilled into, we placed
the monitor into the mount, and painted each of the 4 screw holes. We then
pressed the back board onto the mounting bolts to get the location of each hole
we needed to drill.

We drilled the holes, and fixed the board to the back of the monitor, and then
used shims to attach the board to the left and right blocks. The monitor mount
was complete.

#4 - Configuring the Raspberry Pi#

## 4.a - RaspBian &amp; Hardware ##

The Raspberry Pi that we are using is a rev.2 512Mb one (although we started
out with a Rev.1 and this worked fine). The Pi is overclocked and less memory
is given to the GPU (this is because many of the emulators we will be running
can’t use GPU assistance). We did have an issue with the raspberry pi
corrupting SD cards routinely; this problem is likely because of the overclock
as only the root partition kept corrupting. To resolve this we decided to use
the SD card solely as a boot loader.

To do this we first flashed the USB stick with a copy of Raspbian. Then we
plugged in our SD card and edited cmdline.txt. Within this file there should be
a parameter labeled ‘root = */dev/blah*’ all we needed to do was to change this
to ‘root = /dev/sda2’ (because parition two of the USB stick was raspbian’s
root partition). Now when the Pi is turned on, the kernel will launch for the
boot partition on the SD card and then everything else is loaded from the USB
stick. This proved to be far more reliable and gave us the benefit that changes
could be made by most Tinkersoc members without the need for a SD card reader.

The rest of the hardware setup is fairly standard. The Raspberry Pi has two USB
ports. One has the arcade controller connected to it (appears as a single
joystick out of the box) and the other runs up to a USB hub. This hub just has
the new USB boot stick and a keyboard plugged in. The keyboard is just for
maintenance use and is hidden inside the vast empty space of the cabinet.

## 4.b - RetroPi ##

RetroPi is an installation script that installs RetroArch. This makes it
considerably easier to build various emulators for the machine with a nice
frontend. The instructions for install are available here:

http://petrockblog.wordpress.com/2012/07/22/retropie-setup-an-initialization-script-for-retroarch-on-the-raspberry-pi/

One important bit is although EmulationStation detects and asks us to configure
the arcade controller on first launch, it does not do this for the emulators.
Instead you use the program retroarch-joyconfig that was installed by retroPi
to configure most of the emulators. retroarch-joyconfig -p 1 will guide you
through what you need to do for the first player and retroarch-joyconfig -p 2
will help you for the second. You can just copy these down or use the -o option
to output the config to a specified file. In our case we just used cat to put
the configuration into /etc/retroarch.cfg. This is the file that needs your
configuration output from retroarch-joyconfig. This provides the controls
needed for most of the mame based programs. The only remaining emulator that we
use was GnGeo. This needed another manual invention. To do this we fired up the
emulator and hit f4 on our keyboard. This let us see the keycodes when keys
were pressed. We did this for each of the arcade controllers buttons and noted
this down. Within the folder .gngeo in the pi’s home directory is a file called
‘gngeorc’. This file was edited (in the joypad section) to reflect the correct
keycodes for each button we wished to map.

## 4.c - The ROMs ##

ROMs are a very difficult area. Many companies have gone bust, but the
copyright still exists. As this arcade machine is in an open public space at a
university, we had to play things extremely safe. One of the main emulators
that we use, Imame4All, has sites on the internet where you can download
compatible roms. This emulator appears to be a much newer Mame version than
AdvanceMame (also easily installable on the Pi) and this made finding roms
easier. In regards to the Roms we only use ones from
http://www.liberatedgames.com/ and others where the license clearly states that
they are free to use; we also do not charge to use our arcade machine.

## 4.d - Backup ##

The Pi took a while to setup (compiling retroarch takes a while), so we quickly
whipped the USB stick onto a Linux based laptop and ran dd if=/dev/sdb
of=mameBackup.img (it is important that you make sure that you specify the
right device). This gave us a backup image of the stick that we could use in
case of any problems. Our USB stick is small so the image of it is also not
very large. Backups like this can be useful if you really don’t want to mess
around setting things up again (or future members don’t know how).
