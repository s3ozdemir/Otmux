extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(on_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func on_pressed():
	get_tree().reload_current_scene()
