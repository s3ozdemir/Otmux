extends Node
class_name CommandOutput

@onready var console_output: Label = $"../TextEdit/ColorRect/ConsoleOutput"



func _ready():
	if Engine.has_singleton("AndroidRuntime"):
		var runtime = Engine.get_singleton("AndroidRuntime")
		print("AndroidRuntime var!")
		var context = runtime.get_activity()
		print("Activity context: ", context)
		write_output("Activity context: " + context)
	else:
		print("AndroidRuntime bulunamadı!")
		write_output("AndroidRuntime bulunamadı!")
#+++++++++++++++++++++++++++++++++++++++++++++
func write_output(output):
	console_output.text = output
