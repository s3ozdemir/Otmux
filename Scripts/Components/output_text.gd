extends TextEdit
class_name OutputText

var input_scene = preload("uid://dhsu7il448v7v")
const IMAGE_OUTPUT = preload("uid://34uq16sknwyq")
func _ready() -> void:
	HelperFunctions.create_scene(input_scene,get_parent())
	Global.output_ready.connect(_on_output_ready)

func _on_output_ready(data):
	if data == null :
		text = " "
		Global.output_ready.disconnect(_on_output_ready)
		print_debug(data,Global.current_direrctory)
		return
	
	if data is ImageTexture:
		ImageOutput.create(get_parent(),data)
	
	text = str(data)
	Global.output_ready.disconnect(_on_output_ready)
