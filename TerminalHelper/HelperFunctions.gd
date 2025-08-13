extends Node
class_name HelperFunctions

static func create_scene(packed_scene : PackedScene, parent : Node):
	var scene = packed_scene.instantiate()
	parent.add_child(scene)
