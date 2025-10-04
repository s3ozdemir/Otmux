extends BuiltinTools
class_name Wait

func run(params : Array):
	print("waited")
	if params.is_empty():
		return set_output_data("parameter is required")
	
	var delay = float(params[0])
	Global.waited.emit(delay)
	return set_output_data("waiting for %.3f seconds" %delay )
	
