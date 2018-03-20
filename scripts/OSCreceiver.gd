
extends OSCreceiver

signal osc_message()

func _process(delta):
	while( has_waiting_messages() ):
		var msg = get_next_message()
		# the osc message is ready to be used at this point
		print( msg )

func _ready():
	set_process(true)
	pass

func _on_OSCreceiver_osc_message_received(msg):
	
	print(msg.ip())
	print(msg.address())
	for i in range(msg.arg_num()):
		print(msg.arg(i))
