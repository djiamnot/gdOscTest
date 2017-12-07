extends OSCtransmitter
tool
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var new_sender = OSCtransmitter.new()

func _ready():
    
    var my_ar = []
    my_ar.append(1)
    my_ar.append("sd")
    print("my arr, ", my_ar)

func _exit_tree():

    new_sender.setAddress("/satie")
    new_sender.appendInt(2)
    new_sender.appendFloat(3.14)
    new_sender.appendString("boo")

    new_sender.sendMessage()
    new_sender.reset()

func _on_OSCtransmitter_script_changed():
    new_sender.init("localhost", 9020)
