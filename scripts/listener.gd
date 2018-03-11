
extends Spatial

signal ready()
signal osc_message()
var osc_ready = false

var osc_listener
# This is how we instantiate the main receiver class. It will probably exist in your scene and 
# interested object will connect to its signal
func _ready():
    osc_listener  = OSCListener.new() # port 18002 by default
    #  port can be changed:
    # osc_listener.setPort(18004)
    
    # osc_message is a signal emitted on every reception of OSC message
    osc_listener.connect("osc_message", self, "_on_osc_msg")
    # there is also 'osc_ready' signal for your c onvenience, emited as soon as the OSC receiver is
    # successfully instantiated
    
# I like to forward the message (at this time, I am considering this my top-level node and scenes
# will be instantiated below it)
func _on_osc_msg(val):
    emit_signal("osc_message", val)
