extends Node

signal command_entered(command:String)
signal received_data(response_code, data)
signal text_copied
signal output_ready(output_data : OutputData)
signal opened_keyboard(height)

var current_direrctory : String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
