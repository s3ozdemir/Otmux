extends Node
class_name BuiltinTools

var tool_feature : Array = []

enum tool_type{
	None,
	Internet,
	AndroidRuntime
}

func set_output_data(data):
	var output_data = OutputData.new()
	output_data.data = data
	output_data.receiver = get_script()
	return output_data
	
func run(params : Array):
	return set_output_data("builtins")

func convert_absolute_path(file: String) -> String:
	var current_dir : String= Global.current_directory  # typo düzeltildi
	
	# Eğer path relative ise (örneğin "hello.txt" veya "../hello.txt")
	if file.is_relative_path():
		var abs_path : String = current_dir.path_join(file)
		# normalize_path() '..' ve '.' gibi kısımları temizler
		return abs_path.simplify_path()
	
	# Zaten absolute path ise direkt döndür
	return file

	
