extends Control

func _on_PlayButton_pressed():
	Global.current_level = 1
	Global.load_level(Global.current_level)

func _on_QuitButton_pressed():
	get_tree().quit()
