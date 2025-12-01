#Command running scheme
#InputText > CommandHandler > OutputTex > InputText
extends Node
class_name CommandHandler

var default_path = OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS)
var builtin_tools_path := "res://Scripts/BuiltinTools/"
var custom_scripts = Global.custom_scripts
var res_path := "res://"

func _ready() -> void:
	set_defaults()
	Global.command_entered.connect(_on_command_entered)

func _on_command_entered(command : String):
	var output = await run_shell_command(command)
	#if output == null : return
	#Global.output_ready.emit(output)

#Sub functions
func run_shell_command(input : String):
	var output : String
	input = input.strip_edges()
	if input == null:
		return output
	
	var space_index = input.find(" ")  # index of first space
	var command = input.substr(0,space_index)
	var params = input.substr(space_index + 1, input.length())
	params = params.split(" ")
	
	if space_index == -1 :
		command = input
		params = []
	
	var builtin_tools = get_tools()
	var path := find_script(command)
	
	if path == "":
		Global.output_ready.emit("no command")
		return
		
	if path.begins_with(res_path):
		await run_script(path,params)
		

func set_defaults():
	Global.current_direrctory = default_path

##returns builtin tool paths with dictionary type
func get_tools() -> Dictionary:
	var builtin_tools : Dictionary
	var dir = DirAccess.open(builtin_tools_path)
	var raw_files = dir.get_files()
	
	for file in raw_files:
		if file.get_extension() == "gd" or file.get_extension() == "gdc":
			builtin_tools[file.get_basename()] = builtin_tools_path.path_join(file)
	
#	getting gd or gdc files in BuiltinTool folder
#	Beacuse builtin tool is in apk.
#	(after compiled to apk, gd files convert from .gd to .gdc files)
	return builtin_tools

func run_script(path:String,params : Array):
	var output_data : String
	var script = load(path) # load script
	output_data = str( await script.new().run(params) ) # run the script 
	
	return output_data
	# (run function is not optional, it is similar to main function in C )
	# eacht tool script needs a run function (gd script tools)

func find_script(command :String) -> String:
	var builtin_tools = get_tools()
	var path :String = ""
	for tool in builtin_tools.keys():
		if tool == command:
			path = builtin_tools[tool]
			return path
	
	if path == "":
		var custom_scripts = Variables.custom_scripts
		for script in custom_scripts.keys():
			if script == command:
				path = script
				return path
	return ""
