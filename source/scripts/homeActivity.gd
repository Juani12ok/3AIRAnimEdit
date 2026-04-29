extends Control

var px = main.screen_width()
var py = main.screen_height()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Hide all submenus, regarless of which one is enabled in the editor.
	$"Main UI/Top Bar/Open Context Menu".button_pressed = 0
	$"Main UI/Top Bar/Options".button_pressed = 0
	$"Main UI/Tabs/Options/Background".button_pressed = 0
	
	# Set some positions to fit screen width.
	$"Main UI/Top Bar".size = Vector2(px,40)
	$"Main UI/Top Bar/Title".position = Vector2((px / 2)-58,8)
	$"Main UI/Top Bar/Options".position = Vector2(px-40,0)
	$"Main UI/Tabs/Options".position = Vector2(px - 167,41)
	$"Main UI/Tabs/Options/Background/Color Picker".position = Vector2(px/2, py/2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# Open/hide context menu
	if ($"Main UI/Top Bar/Open Context Menu".button_pressed):
		$"Main UI/Tabs/Context Menu".show()
	else:
		$"Main UI/Tabs/Context Menu".hide()
	
	# Same thing but for options
	if ($"Main UI/Top Bar/Options".button_pressed):
		$"Main UI/Tabs/Options".show()
	else:
		$"Main UI/Tabs/Options".hide()
	
	# Special handling for Dark Mode button
	if ($"Main UI/Tabs/Options/Dark Mode".button_pressed):
		$"Main UI/Tabs/Options/Dark Mode".icon.region = Rect2(32,96,32,32)
	else:
		$"Main UI/Tabs/Options/Dark Mode".icon.region = Rect2(0,96,32,32)
	
	# Background test
	if ($"Main UI/Tabs/Options/Background".button_pressed):
		$"Main UI/Tabs/Options/Background/Color Picker".show()
	else:
		$"Main UI/Tabs/Options/Background/Color Picker".hide()
	
	if ($"Main UI/Tabs/Options/Settings".button_pressed):
		get_tree().change_scene_to_file("res://activities/settings.tscn")
