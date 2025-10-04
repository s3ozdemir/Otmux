extends Node
class_name BuiltinTools

var tool_feature : Array = []

enum tool_type{
	None,
	Internet,
	AndroidRuntime
}

func set_output_data(data):
	var output_data = OutputData.new()
	output_data.data = data
	output_data.receiver = self
	return output_data
	
func run(params : Array):
	
	return set_output_data("builtins")
