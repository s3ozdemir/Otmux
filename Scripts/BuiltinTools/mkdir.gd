extends Node

func run(params :Array):
	if params.is_empty():
		return "parameter is required"
	
	var entry = params[0]
	var path = HelperFunctions.convert_to_path(entry)
	var dir = DirAccess.open(Global.current_direrctory)
	dir.make_dir(path)
	
