extends Tool
class_name Img

func run(params: Array):
	if params.is_empty():
		echo("no paramater")
	
	var path : String = params[0]
	var result : String = "[img]%s[/img]" %path
	
	echo(result)
	
