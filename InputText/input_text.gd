extends TextEdit
class_name InputText


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gui_input.connect(_on_gui_input)
	

func _on_gui_input(event: InputEvent) -> void:
	if has_focus():
		if event is InputEventKey and event.pressed:
			if event.keycode == KEY_ENTER:
				print_debug("entered")
				accept_event()
				editable = false
				Global.entered.emit(text)
				gui_input.disconnect(_on_gui_input)
	
