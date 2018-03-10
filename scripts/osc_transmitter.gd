extends OSCtransmitter

var new_sender = OSCtransmitter.new()
var parent

signal exit()

func _ready():
    set_process(true)
    parent = get_parent()
    new_sender.init("localhost", 9020)
    
func _process(delta):
    new_sender.setAddress("/update")
    new_sender.appendString(parent.get_name())
    new_sender.appendFloat(parent.translation.x)
    new_sender.appendFloat(parent.translation.y)
    new_sender.appendFloat(parent.translation.z)
    new_sender.sendMessage()
    new_sender.reset()
    
    
    
