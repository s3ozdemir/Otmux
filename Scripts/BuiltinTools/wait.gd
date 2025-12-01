extends Tool
class_name Wait

func run(params : Array):
	print("waited")
	if params.is_empty():
		echo("parameter is required")
	
	var delay = float(params[0])
	Global.waited.emit(delay)
	echo("waiting for %.3f seconds" %delay )
	
