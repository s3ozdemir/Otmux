extends Tool
class_name Cp

func run(params : Array):
	#echo("not ready")
	if params.size() < 2:
		echo(Messages.parameter_message)
	
	var target_path = params[params.size()-1]
	var entries : Array
	var counter := 0
	var dir = DirAccess.open(Global.current_direrctory)
	
	for entry in params:
		if counter == params.size() - 1:
			break
		var entry_path :String = get_entry_path(entry)
		
		if entry_path.is_empty():
			continue
		
		entries.append(entry_path)
		counter += 1
	
	for entry in entries:
		dir.copy(entry,target_path)
	
	echo("process finished")
