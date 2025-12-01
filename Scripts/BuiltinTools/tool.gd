extends Node
class_name Tool

func run(params : Array):
	echo()

func convert_absolute_path(path: String) -> String:
	if path == null or path.is_empty():
		echo("path is corrupted")
		return ""
	
	var current_dir : String= Global.current_directory  # type fixed
	# if path is relative (example "hello.txt" or "../hello.txt")
	if path.is_relative_path():
		var abs_path : String = ProjectSettings.globalize_path(path)
		# normalize_path() '..' ve '.' gibi kısımları temizler
		return abs_path.simplify_path()
	
	# Zaten absolute path ise direkt döndür
	return path

func echo(output : String = ""):
	Global.output_ready.emit(output)

func is_directory():
	pass

##returns path of entry if it has
func get_entry_path(entry : String):
	var path = Global.current_direrctory.path_join(entry)
	var dir = DirAccess.open(Global.current_direrctory)
	
	if dir.dir_exists(path) or dir.file_exists(path) :
		return path
	
	return ""
	
