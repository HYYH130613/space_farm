extends Node

var screen_2 = preload("res://scenes/screen2.tscn")


func start_game():
	if get_tree().paused:
		continue_game()
		return
	
	transition_to_scene(screen_2.resource_path)
	
	
func continue_game():
	get_tree().paused = false
	
	
func transition_to_scene(scene_path):
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file(scene_path)
