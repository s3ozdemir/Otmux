extends ScrollContainer

var scroll_bar : VScrollBar
func _ready() -> void:
	scroll_bar = get_v_scroll_bar()
	Global.output_ready.connect(_on_output_ready)

#func _process(delta: float) -> void:
	#pass

func _on_output_ready(output_data : String):
	#print_debug(scroll_bar)
	await get_tree().create_timer(0.5).timeout
	scroll_bar.value = scroll_bar.max_value
	
