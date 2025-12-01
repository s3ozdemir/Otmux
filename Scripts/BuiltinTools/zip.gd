extends Tool
class_name Zip

func run(params : Array):
	if params.is_empty():
		echo(Messages.parameter_message)
	
	var file_pahts : String = convert_absolute_path(params[0])
	var output_path = params[1]
	output_path = convert_absolute_path(output_path)
	zip_file(output_path, file_pahts)
	echo(str(OK))

func zip_file(output_path : String, file_paths : String):
	if output_path.is_empty() or file_paths.is_empty():
		return Messages.file_path
	
	var writer = ZIPPacker.new()
	output_path = output_path + ".zip"
	var err = writer.open(output_path)
	if err != OK:
		return err
		
	for file_path in file_paths:
		writer.start_file(file_path)
		writer.write_file(get_data(file_path))
		writer.close_file()
	writer.close()
	return OK

func get_data(path : String):
	var file = FileAccess.open(path, FileAccess.READ)
	var content = file.get_as_text()
	return content
