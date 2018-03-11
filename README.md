# OSC protocol demo

This is a Godot game engine demo using [OSC module](https://github.com/djiamnot/gdosc). The demo listens on port 18002 and sends to port 9020 (all communication is in UDP)

Get yourself an OSC capable client to have a go. I use liblo tools (on Ubuntu: `sudo apt install liblo-tools`)
Use two terminals for the following commands:

* `oscsend localhost 18002 /ActorReceiver sfff pos -1. 0. 0.`
* `oscdump 9020` to see received values

Left/Right arrow moves the sphere (and the oscdump should reflect the `x` location change)

The `pos` message sent to /ActorReceiver, updates the location of the cube.
There are some comments in the code that should be helpful
