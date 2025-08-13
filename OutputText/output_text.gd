extends TextEdit
class_name OutputText

var input_scene = preload("uid://dhsu7il448v7v")

func _ready() -> void:
	HelperFunctions.create_scene(input_scene,get_parent())
	Global.received_data.connect(_on_received_data)
	

func _on_received_data(response_code : int,data):
	if data :
		text = data
	else:
		text = " " 
