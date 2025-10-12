extends TextEdit
class_name OutputText

var input_scene = preload("uid://dhsu7il448v7v")

func _ready() -> void:
	Global.waited.connect(on_waited)
	Global.output_ready.connect(_on_output_ready)

func _on_output_ready(output_data : OutputData):
	var output : String
#	http outputları http_request üzerinden özel olarak yazılıyor
	output = "%s > %s \n" % [output_data.receiver, output_data.data]
	write_output(output)

func write_output(output : String) -> void:
	if output.length() > 1024:
		pass
	
	insert_text(output,get_last_full_visible_line(), 0)

func on_waited(delay):
	pass
	
