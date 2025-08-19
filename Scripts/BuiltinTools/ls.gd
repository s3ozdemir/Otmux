extends BuiltinTools
class_name Ls

# Called when the node enters the scene tree for the first time.
func run(params : Array):
	return list_dir_contents()

func list_dir_contents():
	var dir = DirAccess.open(Global.current_direrctory)
	var result = dir.get_directories() + dir.get_files()
	print_debug(result)
	return set_output_data(result)
	
