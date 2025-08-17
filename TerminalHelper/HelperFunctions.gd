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
