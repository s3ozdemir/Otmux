extends Node

signal command_entered(command:String)
signal received_data(response_code, data)
signal text_copied
signal output_ready(output : String)
##send_request(url : String, output_data : OutputData )
signal send_request(url : String, output_data : String )
signal waited(delay : float)

##signal for api request
##Global.request_asked(url :String, output_data :OutputData)
##url parameter is required but output_data is optional 
signal request_asked(http_parameters :Array, output_data :String)
signal opened_keyboard(height)

var current_direrctory : String
var custom_scripts : Dictionary

func _ready() -> void:
	current_direrctory = OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS)
	

func get_http_request() -> HTTPRequest:
	return get_parent().get_tree().current_scene.get_node("HTTPRequest")
	

func get_command_handler() -> CommandHandler:
	return get_tree().current_scene.get_node("CommandHandler")

func get_otmux():
	return get_tree().current_scene

func get_output_text():
	var otmux = get_otmux()
	var output_text : OutputText = otmux.get_node("TabContainer/Terminal/OutputContainer/VBoxContainer/OutputText")
	return output_text
