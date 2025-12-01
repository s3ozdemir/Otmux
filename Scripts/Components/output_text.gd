extends RichTextLabel
class_name OutputText

var input_scene = preload("uid://dhsu7il448v7v")

func _ready() -> void:
	Global.waited.connect(on_waited)
	Global.output_ready.connect(_on_output_ready)

func _on_output_ready(output_data : String):
	var output : String
#	http outputları http_request üzerinden özel olarak yazılıyor
	output = "> %s \n" %  str(output_data)
	write_output(output)
	await get_tree().create_timer(.1).timeout
	get_v_scroll_bar().value = get_v_scroll_bar().max_value

func write_output(output : String) -> void:
	append_text(output)

func on_waited(delay):
	pass
