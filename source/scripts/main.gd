extends Node

func screen_width() -> int:
	if (OS.has_feature("mobile")):
		return DisplayServer.screen_get_size().x
	return DisplayServer.window_get_size().x

func screen_height() -> int:
	if (OS.has_feature("mobile")):
		return DisplayServer.screen_get_size().y
	return DisplayServer.window_get_size().y
