extends Node

var custom_scripts : Dictionary

func register_script(path : String):
	var script_name = path.get_basename().get_file()
	custom_scripts[script_name] = path
	

#func _ready() -> void:
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
