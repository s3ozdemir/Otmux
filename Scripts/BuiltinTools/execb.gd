extends Tool
class_name Execb

func run(params : Array):
	var input := str(params)
	var command_handler : CommandHandler = Global.get_command_handler()
	input = input.replace("[","").replace("]","").replace('"',"").replace(",","").strip_edges()
	var output : String = await command_handler.run_shell_command(input)
	print_debug(output)
	echo(output)
