extends Tool
class_name Wait

func run(params : Array):
	var delay := 1.0
	if params.is_empty():
		echo("parameter is required")
		
	else:
		delay = float(params[0])
	
	Global.waited.emit(delay)
	echo("waiting for %.3f seconds" %delay )
	
