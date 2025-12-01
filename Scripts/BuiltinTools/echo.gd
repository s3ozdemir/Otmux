extends Tool
class_name Echo

func run(params : Array):
	var result : String = ""
	for param in params:
		result += " %s" %param
	echo(result)
