extends Spatial

signal ready()
signal osc_message()
var osc_ready = false

var osc_listener

func _ready():
    # Called every time the node is added to the scene.
    # Initialization here
    self.connect("ready", self, "_on_ready")
    osc_listener  = OSCListener.new()
    emit_signal("ready")

    
func _process(delta):
    if (osc_ready):
        print("***")
        var msg = osc_listener.get_msg()
        print("received osc ", msg)
        emit_signal("osc_message")

func _on_ready():
    print("ready")
    # osc_listener.setup(18002)
    while (!osc_ready):
        if (osc_listener):
            osc_ready = true
            self.set_process(true)