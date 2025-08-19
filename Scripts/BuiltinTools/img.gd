extends BuiltinTools
class_name Img

func run(params: Array):
	if params.is_empty():
		return set_output_data(Messages.parameter_message)
		
	var file_reference = params[0]
	var image_path: String = HelperFunctions.convert_to_path(file_reference)
	
	# Image oluştur ve dosyayı yükle
	var image = Image.new()
	var err = image.load(image_path)
	if err != OK:
		return set_output_data(error_string(err))
	
	# ImageTexture oluştur
	var texture = ImageTexture.new()
	texture.create_from_image(image)
	return set_output_data(texture)
