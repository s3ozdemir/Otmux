extends BuiltinTools
class_name Echo

func run(params : Array):
	var result : String = ""
	for param in params:
		result += " %s" %param
	print_debug(result)
	return set_output_data(result)
