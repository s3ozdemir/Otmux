extends TextureRect
class_name ImageOutput

var path: String
static var img_tex
const IMAGE_OUTPUT = preload("uid://34uq16sknwyq")
func _ready() -> void:
	texture = img_tex
	pass

static func create(parent : Control, _texture : Texture2D):
	var img_scene = IMAGE_OUTPUT.instantiate()
	parent.add_child(img_scene)
	OS.delay_msec(500)
	img_tex = _texture
