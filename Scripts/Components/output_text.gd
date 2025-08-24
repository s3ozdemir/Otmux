extends TextEdit
class_name OutputText

var input_scene = preload("uid://dhsu7il448v7v")


func _ready() -> void:
	
	Global.output_ready.connect(_on_output_ready)
	

func _on_output_ready(output_data : OutputData):
	if output_data == null :
		text = "output is null"
		print_debug(output_data)
		HelperFunctions.create_scene(input_scene,get_parent())
		Global.output_ready.disconnect(_on_output_ready)
		return
	
	if output_data.receiver is Gdown:
		pass
	text = str(output_data.data)
	HelperFunctions.create_scene(input_scene,get_parent())
	
	
	
	Global.output_ready.disconnect(_on_output_ready)
