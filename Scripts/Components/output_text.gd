extends TextEdit
class_name OutputText

var input_scene = preload("uid://dhsu7il448v7v")
var base_text : String = "Waiting"


func _ready() -> void:
	Global.waited.connect(on_waited)
	Global.output_ready.connect(_on_output_ready)

func _on_output_ready(output_data : OutputData):
	var output : String
	var receiver : String
	if output_data.receiver is Gdown:
		pass
	
	output = "%s > %s \n" % [output_data.receiver, output_data.data]
	insert_line_at(0, output)

func animate_waiting(delay : float):
	print(get_first_visible_line())

func on_waited(delay):
	animate_waiting(delay)
