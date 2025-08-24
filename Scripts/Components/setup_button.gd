extends Button
class_name SetupButton

var system = "System"
func _ready() -> void:
	pressed.connect(on_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_pressed():
	var documents_path = OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS)
	var dir = DirAccess.open(documents_path)
	dir.make_dir_recursive("")
