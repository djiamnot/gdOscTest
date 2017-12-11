extends MeshInstance

var osc
var _process_osc = false
           
func _ready():
    # Called every time the node is added to the scene.
    # Initialization here
    set_process_input(true)
    set_process(true)
    osc = get_parent_spatial()
    osc.connect("ready", self, "_on_scene_ready")

func _on_scene_ready():
    print("osc instance? ", osc.osc_listener)
    if (osc.osc_listener):
        _process_osc = true
        osc.connect("osc_message", self, "_on_osc_message")
    

func _on_osc_message(val):
    print("*************", val)
    
func _input(event):
    print("obj1:event:get_msg ", osc.osc_listener.get_msg());
    if event.is_action_pressed("ui_left"): 
        translate(Vector3(-5, 0, 0))
    if event.is_action_pressed("ui_right"): 
        translate(Vector3(5, 0, 0))
        
func _process(delta):
    pass

func _on_ready():
    print("osc listener said it's ready")
    # osc_listener.connect("osc_message", self, "_on_osc_message")

func _on_OSCListener_osc_message(val):
    print(get_name(), " ", val)
    print(val[0].right(1))
    if val[0].right(1).match(get_name()):
        print("matching name")
        if val[1] == "pos":
            print(self, " ", self.translation)
            translate(Vector3(2,0,0))
            print(self, " ", self.translation)
            # translate(Vector3(val[2], val[3], val[4]))
            print("position ", val[2], " ",val[3], " ", val[4])