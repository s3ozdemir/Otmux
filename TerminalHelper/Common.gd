extends Node
class_name Common

static var android_runtime = Engine.get_singleton("AndroidRuntime")

# Called when the node enters the scene tree for the first time.
func notes_of_docs():
	pass
	

## Returns an Intent object on Android.
## 
## An Intent is used for communication between applications
## or components within an application.[br]
##[codeblock]
##var android_runtime = Engine.get_singleton("AndroidRuntime")
##if android_runtime:
##	var Intent = JavaClassWrapper.wrap("android.content.Intent")
##	var activity = android_runtime.getActivity()
##	var intent = Intent.Intent() # Call the constructor.
##	intent.setAction(Intent.ACTION_SEND)
##	intent.putExtra(Intent.EXTRA_TEXT, "This is a test message.")
##	intent.setType("text/plain")
##	activity.startActivity(intent)
##[/codeblock]
##[color=cyan][/color]
##[url=https://developer.android.com/reference/android/content/Intent]
##[color=cyan] Offical Android Docs[/color]
##[/url]
## 
##[br]
##[url=https://medium.com/@ashfaque-khokhar/intent-in-android-00f7be3197c0]
## [color=cyan] A Short Article[/color]
##[/url]
static func getIntentClass():
	return JavaClassWrapper.wrap("android.content.Intent")

## Returns the AndroidRuntime Activity
static func getActivty():
	return android_runtime.getActivity()

## Returns Android Native ToastClass
## This method is for custom usage
## Sample Usage:
## [codeblock] 
##var android_runtime = Common.android_runtime
##if android_runtime:
##		var activity = android_runtime.getActivity()
##		var toast_callable = func():
##			var ToastClass = Common.getNativeToastClass()
##			ToastClass.makeText(activity, "This is a test", ToastClass.LENGTH_LONG).show()
##		activity.runOnUiThread(android_runtime.createRunnableFromGodotCallable(toast_callable))
##[/codeblock]
static func getNativeToastClass():
	return JavaClassWrapper.wrap("android.widget.Toast")

static func getUriClass():
	return JavaClassWrapper.wrap("android.net.uri")
