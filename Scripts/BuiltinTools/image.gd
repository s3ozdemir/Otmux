extends Node

func run(params: Array):
	if params.is_empty():
		return "parameter is missing"
		
	var file_reference = params[0]
	var image_path: String = HelperFunctions.convert_to_path(file_reference)
	
	# Image oluştur ve dosyayı yükle
	var image = Image.new()
	var err = image.load(image_path)
	if err != OK:
		return error_string(err)
	
	# ImageTexture oluştur
	var texture = ImageTexture.new()
	texture.create_from_image(image)
	
	return texture


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
