extends Node
class_name KeyboardWatcher

var is_keyboard_open := false

func _process(delta: float) -> void:
	if DisplayServer.has_feature(DisplayServer.FEATURE_VIRTUAL_KEYBOARD):
		var kb_open = DisplayServer.virtual_keyboard_get_height() > 0
		if kb_open != is_keyboard_open:
			is_keyboard_open = kb_open
			Global.opened_keyboard.emit(DisplayServer.virtual_keyboard_get_height()) 
