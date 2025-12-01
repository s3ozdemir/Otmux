extends Tool
class_name Gdown

var result : int
var result_text
func run(params : Array):
	if params.is_empty():
		Global.output_ready.emit(Messages.parameter_message)
	
	print_debug("request")
	var http = HTTPRequest.new()
	Global.add_child(http)
	http.request_completed.connect(request_completed)
	var url :String = params[0]
	var body = JSON.new().stringify({"name": "Godette"})
	var err = http.request(url,[], HTTPClient.METHOD_POST, body)
	
	if err != OK:
		Global.output_ready.emit(Messages.parameter_message)
		
	await http.request_completed
	echo(Messages.parameter_message)
	
func request_completed(_result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray):
	print_debug("request_completed")
	
	if response_code == 200:
		var text = body.get_string_from_utf8()
		print("Dosya içeriği:\n", text)
		result_text =  text
	
	else:
		print("HTTP Error:", response_code)
		echo("HTTP Error:" + str(response_code))
	
