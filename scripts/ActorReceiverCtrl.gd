extends MeshInstance

var osc
           
func _ready():
    set_process_input(true)
    set_process(true)
    # here we get the node where OSC communication is received.
    # it emits a 'osc_message' signal
    osc = get_parent_spatial()
    osc.connect("osc_message", self, "_on_osc_message")

func _on_osc_message(val):
    print(get_name(), " ", val)
    # test for my name
    if val[0].right(1).match(get_name()):
        print("matching name -- _on_osc_message")
        if val[1] == "pos":
            translate(Vector3(val[2], val[3], val[4]))
        
func _process(delta):
    pass

func _on_ready():
    print("osc listener said it's ready")