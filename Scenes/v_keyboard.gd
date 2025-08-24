extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.opened_keyboard.connect(on_opened_keyboard)

func on_opened_keyboard(height : int):
	size.y = height
