@tool
extends EditorScript

var builtin_path := "res://Scripts/BuiltinTools/"
var save_path := "res://Resources/CommandSuggestions.tres"

func _run() -> void:
	var dir = DirAccess.open(builtin_path)
	var command_files := dir.get_files()
	var commands := []
	
	for command in command_files :
		if command.get_extension() == "gd":
			var command_name = command.get_basename()
			commands.append(command_name)
		# Resource oluştur
	var res = load("res://Resources/CommandSuggestions.gd").new()
	res.builtin_commands = commands
	
	# Dosyaya kaydet
	var err := ResourceSaver.save(res, save_path)
	if err == OK:
		print("Kaydedildi -> %s" % save_path)
	else:
		push_error("Kaydedilemedi! Hata kodu: %s" % err)
	
