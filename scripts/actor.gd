extends Position3D

func _ready():
    set_process_input(true)

func _input(event):
    if event.is_action_pressed("ui_left"): 
        translate(Vector3(-0.5, 0, 0))
    if event.is_action_pressed("ui_right"): 
        translate(Vector3(0.5, 0, 0))