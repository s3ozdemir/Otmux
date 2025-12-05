extends Tool
class_name Req

var output_datas : Array
var datas : Array
var done := false

func run(params : Array):
	if params.is_empty():
		echo(Messages.parameter_message)
	
	var url : String = params[0]
	var file_name := url.get_file()
	#var file_path = create_file(file_name)
	var http :HTTPRequest = Global.get_http_request()
	
	http.download_file = Global.current_direrctory
	http.request(url)
	echo(Messages.response_waiting)

func create_file(file_name : String):
	var download_path := OS.get_system_dir(OS.SYSTEM_DIR_DOWNLOADS)
	var file_path := download_path.path_join(file_name)
	var file = FileAccess.open(file_path,FileAccess.WRITE)
	return file_path
