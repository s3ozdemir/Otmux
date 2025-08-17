extends Node

func run(params : Array):
	if params.is_empty():
		return "no parameter"
	
	var uri : String = Global.current_direrctory.path_join(params[0])
	
	var error = OS.shell_open(uri)
	
	if error != OK:
		print_debug(error_string(error))
		return error_string(error)
	return "openex runned"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print("openex")
