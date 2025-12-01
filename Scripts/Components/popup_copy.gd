extends PopupPanel

func _ready() -> void:
	Global.text_copied.connect(_on_text_copied)
	
func _on_text_copied():
	popup()
	await get_tree().create_timer(1).timeout
	hide()

func change_color():
	pass
