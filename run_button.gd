extends Button

@onready var text_edit: TextEdit = $".."
@onready var console_output: Label = $"../ColorRect/ConsoleOutput"
@onready var command = text_edit.text
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(on_pressed)


func on_pressed():
	pass
	
