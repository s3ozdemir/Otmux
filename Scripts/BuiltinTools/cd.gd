extends Tool
class_name Cd

func run(params):
#	[".."]
	if !params:
		echo("select directory")
	
	var param = params[0]
	change_directory(param)

func change_directory(entry : String):
	if !entry.is_absolute_path():
		entry = Global.current_direrctory.path_join(entry)
	
	var dir = DirAccess.open(entry)
	
	if dir == null:
		echo("no directory")
		return
	
	Global.current_direrctory = dir.get_current_dir()
	echo("changed directory")
