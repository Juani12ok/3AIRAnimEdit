extends Control

@onready var menu = $"Top Bar/Open Context Menu"
@onready var options = $"Top Bar/Options"
@onready var darkMode = $"Tabs/Options/Dark Mode"

var px = DisplayServer.screen_get_size().x
var py = DisplayServer.screen_get_size().y

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Hide all submenus, regarless of which one is enabled in the editor.
	menu.button_pressed = 0
	options.button_pressed = 0
	
	# Set some positions to fit screen width.
	$"Top Bar".size = Vector2(px,40)
	$"Top Bar/Title".position = Vector2((px / 2)-58,8)
	$"Top Bar/Options".position = Vector2(px-40,0)
	$"Tabs/Options".position = Vector2(px - 167,41)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# Open/hide context menu
	if (menu.button_pressed):
		$"Tabs/Context Menu".show()
	else:
		$"Tabs/Context Menu".hide()
	
	# Same thing but for options
	if (options.button_pressed):
		$"Tabs/Options".show()
	else:
		$"Tabs/Options".hide()
	
	# Special handling for Dark Mode button
	if (darkMode.button_pressed):
		darkMode.icon.region = Rect2(32,96,32,32)
	else:
		darkMode.icon.region = Rect2(0,96,32,32)
