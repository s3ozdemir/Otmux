extends HTTPRequest
class_name HTTPManager

func _ready() -> void:
	request_completed.connect(_on_request_completed)


func _on_entered(command : String):
	#send_data(command)
	pass

func _on_http_requested(url : String):
	pass


#func send_data(data: String):
	#
	#var ip = get_avaible_IP()
	#print_debug(get_avaible_IP())
	#var headers = ["Content-Type: application/x-www-form-urlencoded"]
	#var body :String= "command=" + data
	#var err = request(
		#"http://0.0.0.0:5000",
		#headers,
		#HTTPClient.METHOD_POST, 
		#body
	#)
#
	#if err != OK:
		#print("HTTP request error:", err)

func _on_request_completed(result, response_code, headers, body :PackedByteArray):
	var data = body.get_string_from_utf8()
	Global.received_data.emit(response_code,data)
	
	print("HTTP response code:", response_code)
	print("Body:", data)
	
#func get_avaible_IP():
	#var addresses := IP.get_local_addresses()
	#for addr in addresses:
		#if addr.begins_with("192.168"):
			#print(addr)
