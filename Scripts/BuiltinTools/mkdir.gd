extends Tool
class_name Mkdir

func run(params :Array):
	if params.is_empty():
		echo(Messages.parameter_message)
	print_debug("mkdir calisti")
	var dir = DirAccess.open(Global.current_direrctory)
	for entry in params:
		var path = HelperFunctions.convert_to_path(entry)
		dir.make_dir(path)
	
	echo(Messages.process_succedded)
