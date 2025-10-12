extends Node

signal command_entered(command:String)
signal received_data(response_code, data)
signal text_copied
signal output_ready(output_data : OutputData)
signal send_request(tool_name : String, url : String,)
signal waited(delay : float)

##signal for api request
##Global.request_asked(url :String, output_data :OutputData)
##url parameter is required but output_data is optional 
signal request_asked(http_parameters :Array, output_data :OutputData)

signal opened_keyboard(height)

var current_direrctory : String

func _ready() -> void:
	pass

func get_http_request() -> HTTPRequest:
	return get_parent().get_tree().current_scene.get_node("HTTPRequest")

func get_command_handler() -> CommandHandler:
	return get_tree().current_scene.get_node("CommandHandler")
	
