extends HTTPRequest

@export var input_text: InputText
@export var output_text: OutputText
var response_datas : Array
var tool

func _ready() -> void:
	request_completed.connect(self._on_request_completed)
	Global.request_asked.connect(_on_request_asked)

func _process(delta: float) -> void:
		pass

func _on_request_asked(url : String, output_data : OutputData):
	var file_name : String = url.get_file()
	download_file = file_name
	response_datas.clear()
	request(url)
	tool = output_data.receiver

func _on_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	output_text.write_output("http request completed")
	response_datas = [result,response_code,headers,body]
	
