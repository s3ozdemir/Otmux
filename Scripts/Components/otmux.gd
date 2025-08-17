extends Control
class_name Otmux

@export var save_button: Button 
@export var font_size: LineEdit

func _ready() -> void:
	save_button.pressed.connect(_on_save_button_pressed)
	print_debug(ClassDB.get_class_list().size())

func _on_save_button_pressed():
	theme.default_font_size = int(font_size.text)
