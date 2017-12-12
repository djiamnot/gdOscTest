extends OSCtransmitter

var new_sender = OSCtransmitter.new()
var parent

signal exit()

func _ready():
    set_process(true)
    set_notify_transform(true)
    parent = get_parent()
    print("parrent: ", parent)
    new_sender.init("localhost", 9020)
    # set_process_input(true)
    
func _process(delta):
    new_sender.setAddress("/satie/source/update")
    new_sender.appendString(get_name())
    new_sender.appendFloat(parent.translation.x)
    new_sender.appendFloat(parent.translation.y)
    new_sender.appendFloat(parent.translation.z)
    new_sender.sendMessage()
    new_sender.reset()
    
    #if NOTIFICATION_TRANSFORM_CHANGED:
        #print("transform changed")
       # emit_signal("exit")

func _exit_tree():
    emit_signal("exit")
    
    
    
