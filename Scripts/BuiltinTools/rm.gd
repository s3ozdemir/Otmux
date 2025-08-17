extends Node

func run(params : Array):
	if params.is_empty():
		return "parameter is required"
		
	var entry = params[0]
	var path = HelperFunctions.convert_to_path(entry)
	var dir = DirAccess.open(Global.current_direrctory)
	dir.remove(path)
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
