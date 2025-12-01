extends Control
class_name Otmux

@export var save_button: Button 
@export var font_size: LineEdit
@export var tool_paths : String
@onready var command_handler: CommandHandler = $CommandHandler

var execb = Execb.new()
var HOME = OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS).path_join("Otmux")

func _ready() -> void:
	save_button.pressed.connect(_on_save_button_pressed)

func _on_save_button_pressed():
	theme.default_font_size = int(font_size.text)

func create_system_paths():
	var tools :Dictionary = command_handler.get_tools()
	
	execb.run(["rm", HOME])
	execb.run(["mkdir", "Otmux"])
	execb.run(["cd", "Otmux"])
	execb.run(["mkdir","Tools Execs Download Temp System"])
	execb.run(["cd","System"])
	execb.run(["mkdir","Paths"])
	execb.run(["touch","PATHS.cfg"])
	execb.run(["cd", HOME.get_base_dir()])

func _on_restart_button_pressed() -> void:
	execb.run(["rm",HOME])
	create_system_paths()

func _on_setup_button_pressed() -> void:
	var documens_path = OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS)
	var documents_dir := DirAccess.open(documens_path)
	if documents_dir.dir_exists("Otmux"):
		print_debug("there is otmux")
		return
	create_system_paths()
