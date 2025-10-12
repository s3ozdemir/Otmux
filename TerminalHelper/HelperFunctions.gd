extends Node
class_name HelperFunctions

static var current_directory : String

static func create_scene(packed_scene : PackedScene, parent : Node):
	var scene = packed_scene.instantiate()
	parent.add_child(scene)
	return scene

static func check_null_values(value):
	if value == null :
		return "There is no parameter"
	else:
		return value
static func convert_to_path(file):
	var path = Global.current_direrctory.path_join(file)
	return path

static func get_tools() -> Dictionary:
	var builtin_tools_path := "res://Scripts/BuiltinTools/"
	var builtin_tools : Dictionary
	var dir = DirAccess.open(builtin_tools_path)
	var raw_files = dir.get_files()
	
	for file in raw_files:
		if file.get_extension() == "gd" or file.get_extension() == "gdc":
			builtin_tools[file.get_basename()] = builtin_tools_path.path_join(file)
#	getting gd or gdc files in BuiltinTool folder
#	Beacuse builtin tool is in apk.
#	(after compiled to apk, gd files convert from .gd to .gdc files)
	return builtin_tools
