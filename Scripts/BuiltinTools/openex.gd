extends BuiltinTools
class_name Openex

func run(params : Array):
	if params.is_empty():
		return set_output_data(Messages.parameter_message)
	
	var uri : String = Global.current_direrctory.path_join(params[0])
	
	var error = OS.shell_open(uri)
	
	if error != OK:
		print_debug(error_string(error))
		return set_output_data(error_string(error))
	
	return set_output_data("openex runned")
