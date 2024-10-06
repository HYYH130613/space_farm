extends CharacterBody2D

@export var movement_speed = 60
@export var hp = 1
@onready var algae = get_tree().get_nodes_in_group('algae')
var closest_distance
var closest_target
var mouse_in := false
var pressed := false


func _physics_process(delta: float):
	print(mouse_in)
	var enemy_position = global_position
	closest_distance = enemy_position.distance_to(algae[0].global_position)
	closest_target = algae[0].global_position
	for alga in algae:
		if alga.global_position.distance_to(enemy_position) <= closest_distance:
			closest_target = alga.global_position
	var direction = global_position.direction_to(closest_target)
	velocity = direction*movement_speed
	if pressed == true:
		queue_free()
	move_and_slide()

func _input(event):
	if event is InputEventMouseButton and event.is_pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_viewport_rect().has_point(to_local(event.position)):
			pressed = true
