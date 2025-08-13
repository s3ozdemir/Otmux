extends GridContainer
class_name TerminalContainer

var output_scene = preload("uid://ggmakp4pooau")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	Global.entered.connect(_on_entered)
	

func _process(delta: float) -> void:
	pass

func _on_entered(commnad:String):
	HelperFunctions.create_scene(output_scene,self)
	
