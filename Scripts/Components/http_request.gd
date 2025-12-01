extends HTTPRequest

@export var input_text: InputText
@export var output_text: OutputText

var response_datas : Array
var tool

func _ready() -> void:
	request_completed.connect(_on_request_completed)

func _process(delta: float) -> void:
		pass

func _on_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	output_text.write_output("http request completed")
