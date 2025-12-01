extends Tool
class_name Rm

func run(params : Array):
	if params.is_empty():
		return Messages.parameter_message
	
	for entry : String in params:
		if entry.is_absolute_path():
			var dir = DirAccess.open(entry)
			dir.remove_absolute(entry)
		
		var path = HelperFunctions.convert_to_path(entry)
		var dir = DirAccess.open(Global.current_direrctory)
		dir.remove(path)
	
	echo("entry is removed")
