extends HTTPRequest
class_name HTTPManager
@export var input_text: InputText

func _ready() -> void:
	Global.request_reserved.connect(_on_request_reserved)

func _process(delta: float) -> void:
	pass

func _on_request_reserved(url):
	request(url)

func _on_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray, source: HTTPRequest) -> void:
	pass 
	
	
