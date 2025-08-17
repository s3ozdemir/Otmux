extends Node


func run(params : Array):
	
	if params.is_empty():
		return "no param"
		
	var content : String
	var _name = params[0]
	
	if params.size() > 1 :
		content = params[1]
		
	var file_access = FileAccess.open(Global.current_direrctory.path_join(_name),FileAccess.WRITE)
	if content:
		file_access.store_string(content)
	
