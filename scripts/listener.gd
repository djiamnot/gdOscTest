
extends Spatial

signal ready()
signal osc_message()
var osc_ready = false

var osc_listener

func _ready():
    # set_port(18004)
    osc_listener  = OSCListener.new() # port 18002 by default
    #  port can be changed:
    # osc_listener.set_port(18004)
    osc_listener.connect("osc_message", self, "_on_osc_msg")
    
func _on_osc_msg(val):
    print("got message ", val)
    emit_signal("osc_message", val)
