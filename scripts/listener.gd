
extends Spatial

signal ready()
signal osc_message()
var osc_ready = false

var osc_listener

func _ready():
    osc_listener  = OSCListener.new() # port 18002 by default
    #  port can be changed:
    # osc_listener.setPort(18004)
    osc_listener.connect("osc_message", self, "_on_osc_msg")
    
func _on_osc_msg(val):
    emit_signal("osc_message", val)
