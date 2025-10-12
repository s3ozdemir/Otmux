extends Control
class_name Otmux

@export var save_button: Button 
@export var font_size: LineEdit
@onready var command_handler: CommandHandler = $CommandHandler

func _ready() -> void:
	save_button.pressed.connect(_on_save_button_pressed)

func _on_save_button_pressed():
	theme.default_font_size = int(font_size.text)

func create_system_paths():
	var documens_path = OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS)
	var documents_dir := DirAccess.open(documens_path)
	if documents_dir.dir_exists("Otmux"):
		return
	
	var execb = Execb.new()
	var tools :Dictionary = command_handler.get_tools()
	execb.run([tools["mkdir"],"Otmux"])
	
