extends CharacterBody2D

@export var movement_speed = 40

@onready var player = get_tree().get_first_node_in_group('algae')

func _physics_process(delta: float):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction*movement_speed
	move_and_slide()
	
	
