extends TextEdit


@export var content : String

func _ready() -> void:
	self.gui_input.connect(_on_gui_input)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_gui_input(event: InputEvent) -> void:
	pass
	if has_focus():
		if event.is_action_pressed("mouse_left"):
			DisplayServer.clipboard_set(content)
			Global.text_copied.emit()
	
