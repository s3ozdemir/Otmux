extends BuiltinTools
class_name Execb

func run(params : Array):
	var input := str(params)
	var command_handler : CommandHandler = Global.get_command_handler()
	input = input.replace("[","").replace("]","").replace('"',"").replace(",","").strip_edges()
	
	var output : OutputData = await command_handler.run_shell_command(input)
	return set_output_data(output.data)
