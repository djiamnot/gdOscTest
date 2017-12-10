extends Position3D

tool

func _ready():
    set_process_input(true)
        
func _process(delta):
    pass
    
func _input(event):
    if event.is_action_pressed("ui_up"): 
        translate(Vector3(-5, 0, 0))
    if event.is_action_pressed("ui_down"): 
        translate(Vector3(5, 0, 0))