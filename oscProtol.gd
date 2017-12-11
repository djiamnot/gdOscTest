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
    print("osc_listener instance: ", osc_listener)
    osc_listener.connect("osc_listener_ready", self, "_on_osc_listener_ready")
    osc_listener.connect("osc_message", self, "_on_osc_msg")
    var conn = osc_listener.is_connected("osc_listener_ready", self, "_on_osc_listener_ready")
    print("connected to signal: ", conn)
    print("listener's port: ", osc_listener.get_port())
    # emit_signal("ready")

func _on_osc_listener_ready():
    print("****************************")
    
func _on_osc_msg(val):
    print("&&&&&&&&&&&&&&&&&&&&", val)
    
func _process(delta):
    if(osc_ready):
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