extends FoldableContainer
class_name ToolNode

const TOOL_NODE = preload("uid://bu0ijqqm71a7w")
@onready var name_node: LineEdit = $VBoxContainer/Name
@onready var path_node: LineEdit = $VBoxContainer/Path

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
