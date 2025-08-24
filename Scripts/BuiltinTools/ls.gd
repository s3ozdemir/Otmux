extends BuiltinTools
class_name Ls

# Called when the node enters the scene tree for the first time.
func run(params : Array):
	return await list_dir_contents()

func list_dir_contents(path: String = Global.current_direrctory):
	var result: Array = []
	var dir := DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			# . ve .. gibi özel dizinleri atla
			if file_name != "." and file_name != "..":
				result.append(file_name)
			file_name = dir.get_next()
		dir.list_dir_end()
	return await set_output_data(result) 
