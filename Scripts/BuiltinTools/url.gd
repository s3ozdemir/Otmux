extends BuiltinTools
class_name Url


var output_datas : Array

func run(params : Array):
	execute_tool("wait",["2"])
	return set_output_data("tools")
	
	
func execute_tool(name : String, params : Array):
	var main_path := "res://Scripts/BuiltinTools/"
	var tool_path : String = main_path.path_join(name + ".gd")
	var dir = DirAccess.open(main_path)
	
	if !dir.file_exists(tool_path):
		print_debug("null")
		return null
	var script = load(tool_path)
	var output_datas = script.new().run(params)
	return set_output_data(output_datas)
