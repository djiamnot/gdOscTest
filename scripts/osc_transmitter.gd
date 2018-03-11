extends OSCtransmitter

var new_sender = OSCtransmitter.new()
var parent

signal exit()

func _ready():
    set_process(true)
    parent = get_parent()
	# set the destination address and port
    new_sender.init("localhost", 9020)
    
func _process(delta):
	# build the message
	# OSC address
    new_sender.setAddress("/update")
	# some other parameters that we want to include
    new_sender.appendString(parent.get_name())
    new_sender.appendFloat(parent.translation.x)
    new_sender.appendFloat(parent.translation.y)
    new_sender.appendFloat(parent.translation.z)
	# actually send the message
    new_sender.sendMessage()
	# reset the queue
    new_sender.reset()
    
    
    
