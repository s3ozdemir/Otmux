extends TextEdit
class_name InputText

@export var output_text: OutputText 
@export var keyboard_shape: Control 

func _ready() -> void:
	focus_entered.connect(_on_focus_entered)
	focus_exited.connect(_on_focus_exited)
	Global.waited.connect(on_waited)
	grab_focus()
	gui_input.connect(_on_gui_input)

func _on_gui_input(event: InputEvent) -> void:
	if has_focus():
		if event is InputEventKey and event.pressed:
			if event.keycode == KEY_ENTER:
				accept_event()
				Global.command_entered.emit(text)
				clear_outputs(text)
				text = ""

func lock_input_text(time : float = 3):
	editable = false
	await get_tree().create_timer(time).timeout
	editable = true

func clear_outputs(input : String):
	if input == "clear":
		output_text.text = ""

func change_input_position():
	var keyboard_height := DisplayServer.virtual_keyboard_get_height()
	keyboard_shape.custom_minimum_size.y = keyboard_height

func _on_focus_entered() -> void:
	change_input_position()

func _on_focus_exited() -> void:
	change_input_position() 

func on_waited(delay : float):
	lock_input_text(delay)
