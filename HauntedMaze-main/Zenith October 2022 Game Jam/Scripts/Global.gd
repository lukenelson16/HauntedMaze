extends Node

var current_level : int = 1
var num_levels : int = 3

func _ready():
	load_level(1)

func load_level(level_num : int):
	var path : String = "res://Scenes/Levels/Level_" + str(level_num) + ".tscn"
	get_tree().change_scene(path)

func reload_level():
	get_tree().reload_current_scene()

func next_level():
	if current_level < num_levels:
		current_level += 1
		load_level(current_level)
	else:
		win()

func win():
	get_tree().change_scene("res://Scenes/WinScreen.tscn")
