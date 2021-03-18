Resolve HUI Timecode Updater
============================

This is a small script for Davinci Resolve that updates the timecode display of
a HUI compatible control surface. The script is tested to work on Behringer
X-Touch One in HUI mode. Currently the timecode display is always showing
the timecode of the active timeline.

The script is not perfect: There is no documented way to hook to the timecode
change events from Lua, even though one probably exists. The other problem is
that for whatever reason, probably because `sendmidi` is competing with
DaVinci's control messages, the timecode updates fails occasionally.

The script works by sending the current timecode periodically to the control
surface. It could be optimized to send the shortest possible change instead
of the full timecode but as the update isn't sent on every frame there
probably shouldn't be any throughput issues.

Unfortunately the timecode is not updated when the transport is in play more
or when the timeline is scrubbed too fast. This seems to be a limitation
in how the lua scripts are executed or put to sleep when the transport is
moving.

Installation
-------------

Install [SendMIDI](https://github.com/gbevin/SendMIDI) somewhere. Perhaps the
easiest way is to download the ZIP from Github and just copy the binary into
your home directory.

Edit the `resolve-hui-tc-updater.lua` script file to execute the `sendmidi`
command from the right path. Then copy the script into DaVinci's Fusion script
directory.

```bash
cp resolve-hui-tc-updater.lua ~/Library/Application\ Support/Blackmagic\ Design/DaVinci\ Resolve/Fusion/Scripts/Comp
```

Usage
-----

Start the script by clicking through the *Workspace* menu:

*Workspace -> Scripts -> Comp -> resolve-hui-tc-updater*

From now on, the script should be running in the background until you quit
DaVinci Resolve.
