extends RigidBody

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
    # Called every time the node is added to the scene.
    # Initialization here
    pass

#func _process(delta):
#    # Called every frame. Delta is time since last frame.
#    # Update game logic here.
#    pass


func _on_OSCListener_osc_message(val):
    rint(get_name(), " ", val)
    print(val[0].right(1))
    if val[0].right(1).match(get_name()):
        print("matching name")
        if val[1] == "pos":
            print("position")
            translate(Vector3(val[2], val[3], val[4]))