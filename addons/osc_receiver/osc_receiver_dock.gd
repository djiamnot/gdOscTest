tool
extends EditorPlugin

var dock # A class member to hold the dock during the plugin lifecycle
var osc_listener

func _enter_tree():
    # Initialization of the plugin goes here
    # First load the dock scene and instance it:
    dock = preload("res://addons/osc_receiver/osc_receiver_dock.tscn").instance()

    # Add the loaded scene to the docks:
    add_control_to_dock( DOCK_SLOT_LEFT_UL, dock)
    # Note that LEFT_UL means the left of the editor, upper-left dock
    osc_listener  = OSCListener.new() # port 18002 by default
    # receiving port can be changed:
    osc_listener.set_port(18004)
    osc_listener.connect("osc_message", self, "_on_osc_msg")

func _exit_tree():
    # Clean-up of the plugin goes here
    # Remove the scene from the docks:
    remove_control_from_docks( dock ) # Remove the dock
    dock.free() # Erase the control from the memory

func _on_osc_msg(val):
    print("dock received: ", val)