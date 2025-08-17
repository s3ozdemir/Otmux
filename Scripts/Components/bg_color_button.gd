extends ColorPickerButton

@export var background: ColorRect
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	color_changed.connect(_on_color_changed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_color_changed(color: Color) -> void:
	background.color = color
