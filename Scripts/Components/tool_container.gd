extends VBoxContainer
class_name ToolContainer

# Called when the node enters the scene tree for the first time.
const TOOL_NODE = preload("uid://bu0ijqqm71a7w")
@export var add_tool_button: Button 

func _ready() -> void:
	add_tool_button.pressed.connect(_on_pressed)
	child_entered_tree.connect(_on_child_entered_tree)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_pressed():
	HelperFunctions.create_scene(TOOL_NODE,self)

func _on_child_entered_tree(node : Node):
	pass
	


func _on_child_exited_tree(node : Node):
	pass
	
	
