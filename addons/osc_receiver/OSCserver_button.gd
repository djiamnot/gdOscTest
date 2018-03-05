tool
extends Button

var osc_listener
signal osc_message()

func _ready():
    # Called every time the node is added to the scene.
    # Initialization here
    connect("pressed",self,"_on_button_pressed")


func _on_osc_msg(val):
    print("dock received: ", val)
    emit_signal("osc_message", val)


func _on_button_pressed():
    # osc_listener  = OSCListener.new() # port 18002 by default
    # receiving port can be changed:
    # osc_listener.set_port(18004)
    # osc_listener.connect("osc_message", self, "_on_osc_msg")
