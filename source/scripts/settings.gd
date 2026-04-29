extends Control

var px = main.screen_width()
var py = main.screen_height()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"Top Bar".size = Vector2(px,40)
	$"Top Bar/Title".position = Vector2((px/2)-31,5)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if ($"Top Bar/Go Back".button_pressed):
		get_tree().change_scene_to_file("res://activities/main.tscn")
