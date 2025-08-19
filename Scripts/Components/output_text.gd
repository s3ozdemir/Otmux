extends TextEdit
class_name OutputText

var input_scene = preload("uid://dhsu7il448v7v")


func _ready() -> void:
	
	Global.output_ready.connect(_on_output_ready)
	

func _on_output_ready(output_data : OutputData):
	if output_data == null :
		text = "output is null"
		print_debug(output_data)
		return
	if output_data.receiver is Gdown:
		pass
	text = str(output_data.data)
	Global.output_ready.disconnect(_on_output_ready)
	
	HelperFunctions.create_scene(input_scene,get_parent())
