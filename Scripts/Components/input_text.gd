extends TextEdit
class_name InputText

func _ready() -> void:
	Global.waited.connect(on_waited)
	grab_focus()
	gui_input.connect(_on_gui_input)

func _on_gui_input(event: InputEvent) -> void:
	if has_focus():
		if event is InputEventKey and event.pressed:
			if event.keycode == KEY_ENTER:
				accept_event()
				Global.command_entered.emit(text)
				text = ""

func on_waited(delay : float):
	lock_input_text(delay)

func lock_input_text(time : float = 3):
	editable = false
	await get_tree().create_timer(time).timeout
	editable = true
	
