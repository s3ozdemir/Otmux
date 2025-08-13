extends Control
class_name Otmux

@export var http_request : HTTPRequest

func _ready() -> void:
	http_request.request_completed.connect(_on_request_completed)
	Global.entered.connect(_on_entered)

func _on_entered(command : String):
	send_data(command)
	

func send_data(data: String):
	var headers = ["Content-Type: application/x-www-form-urlencoded"]
	var body :String= "command=" + data
	var err = http_request.request(
		"http://127.0.0.1:5000/data",
		headers,
		HTTPClient.METHOD_POST, 
		body# <-- bu argüman artık ayrı değil, body request içine gömülüyor
	)

	if err != OK:
		print("HTTP request error:", err)

func _on_request_completed(result, response_code, headers, body :PackedByteArray):
	var data = body.get_string_from_utf8()
	Global.received_data.emit(response_code,data)
	
	print("HTTP response code:", response_code)
	print("Body:", data)
	
