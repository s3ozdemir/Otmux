extends Tool
class_name Openex

func run(params : Array):
	if params.is_empty():
		echo(Messages.parameter_message)
	
	var uri : String = Global.current_direrctory.path_join(params[0])
	var error = OS.shell_open(uri)
	
	if error != OK:
		print_debug(error_string(error))
		echo(error_string(error))
	
	echo("openex runned") 
