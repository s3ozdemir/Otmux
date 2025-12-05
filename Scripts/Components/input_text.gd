extends CodeEdit
class_name InputText

@export var output_text: OutputText 
@export var output_container: ScrollContainer

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

func _on_focus_entered() -> void:
	output_container.ensure_control_visible(self)

func _on_focus_exited() -> void:
	output_container.ensure_control_visible(self)

func on_waited(delay : float):
	lock_input_text(delay)
