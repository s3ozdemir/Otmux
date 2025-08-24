extends BuiltinTools
class_name Cd

func run(params):
#	[".."]
	if !params:
		return set_output_data("select directory")
	var param = params[0]
	print_debug(param)
	change_directory(param)
	return set_output_data(Messages.process_succedded)


func change_directory(entry : String):
	var target_path = Global.current_direrctory.path_join(entry)
	#print_debug(target_path)
	var dir = DirAccess.open(target_path)
	
	if dir != null:
		Global.current_direrctory = dir.get_current_dir()
		return set_output_data("changed dir")
	
	var absolute_dir = DirAccess.open(entry)
	if absolute_dir != null :
		Global.current_direrctory = absolute_dir.get_current_dir()
		return set_output_data("changed dir")
	
	return set_output_data("There is no Directory")

	
