extends BuiltinTools
class_name Mv

func run(params : Array):
	return set_output_data("not ready yet")
	var current_path = params[0]
	if current_path is String:
		if current_path.is_absolute_path():
			var dir = DirAccess.open(current_path)
			if dir != OK:
				return set_output_data("path is not correct")
			
	return set_output_data("moved")

func move_folder(old_path : String, new_path : String):
	var dir = DirAccess.open("user://")
	if not dir.dir_exists_absolute(old_path):
		return "error"

func move_file():
	pass
