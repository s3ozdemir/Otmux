extends Node

signal command_entered(command:String)
signal received_data(response_code, data)
signal text_copied
signal output_ready(output_data : OutputData)
signal waited(delay : float)

signal request_reserved(url)

signal opened_keyboard(height)
var current_direrctory : String


func _ready() -> void:
	pass
