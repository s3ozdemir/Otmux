extends BuiltinTools
class_name Gdown

var result : int
var result_text
func run(params : Array):
	if params.is_empty():
		return set_output_data(Messages.parameter_message)
	
	print_debug("request")
	var http = HTTPRequest.new()
	Global.add_child(http)
	http.request_completed.connect(request_completed)
	var url :String = params[0]
	var body = JSON.new().stringify({"name": "Godette"})
	var err = http.request(url,[], HTTPClient.METHOD_POST, body)
	
	if err != OK:
		return set_output_data("Error %s" % error_string(err))
		
	await http.request_completed
	return set_output_data(result_text)
	
func request_completed(_result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray):
	print_debug("request_completed")
	
	if response_code == 200:
		var text = body.get_string_from_utf8()
		print("Dosya içeriği:\n", text)
		result_text =  text
	
	else:
		print("HTTP Error:", response_code)
		return set_output_data("HTTP Error:" + str(response_code))
	
