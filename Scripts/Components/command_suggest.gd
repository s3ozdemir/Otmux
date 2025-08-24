extends Node
class_name CommandSuggester

func _ready():
	run_command("ls /sdcard") # Örnek: Android’de sdcard dizinini listele

func run_command(command: String):
	if OS.get_name() != "Android":
		return
	var Runtime = JavaClassWrapper.wrap("java.lang.Runtime")
	var Process = Runtime.getRuntime().exec(command)
	
	# Process'ten çıkışı okumak için
	var InputStream = Process.getInputStream()
	var Scanner = JavaClassWrapper.wrap("java.util.Scanner")
	var scanner = Scanner.new(InputStream).useDelimiter("\\A")
	   
	var output = ""
	if scanner.hasNext():
		output = scanner.next()
	scanner.close()
	print("Komut çıktısı: ", output)

func register_command(name:String, params : Array):
	name
