extends Node


func run(params):
#	[".."]
	if !params:
		return "select directory"
	var param = params[0]
	print_debug(param)
	return change_directory(param)


func change_directory(entry : String):
	var target_path = Global.current_direrctory.path_join(entry)
	#print_debug(target_path)
	var dir = DirAccess.open(target_path)
	
	if dir != null:
		Global.current_direrctory = dir.get_current_dir()
		return "changed dir"
	
	var absolute_dir = DirAccess.open(entry)
	if absolute_dir != null :
		Global.current_direrctory = absolute_dir.get_current_dir()
		return "changed dir"
	
	return "There is no Directory"

	
