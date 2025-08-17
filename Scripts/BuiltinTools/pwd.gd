extends Node


# Called when the node enters the scene tree for the first time.
func run(params : Array):
	return print_working_directory()

func print_working_directory():
	return Global.current_direrctory
