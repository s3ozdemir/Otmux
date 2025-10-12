extends BuiltinTools
class_name Breq

var output_datas : Array
var datas : Array
var done := false

func run(params : Array):
	if params.is_empty():
		return set_output_data(Messages.parameter_message)
	
	var url : String = params[0]
	Global.request_asked.emit(url)
	
	return set_output_data(Messages.response_waiting)

#func execute_tool(name : String, params : Array):
	#var main_path := "res://Scripts/BuiltinTools/"
	#var tool_path : String = main_path.path_join(name + ".gd")
	#var dir = DirAccess.open(main_path)
	#
	#if !dir.file_exists(tool_path):
		#print_debug("null")
		#return null
	#var script = load(tool_path)
	#var output_datas = script.new().run(params)
	#return set_output_data(output_datas)
