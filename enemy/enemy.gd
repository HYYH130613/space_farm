extends CharacterBody2D

@export var movement_speed = 80
@export var hp = 1
@onready var dead_sound = get_node("Death")
@onready var anim = get_node("AnimationPlayer")
@onready var algae
var closest_distance
var closest_target
var mouse_in := false
var pressed := false

func die():
	if pressed == true:
		print('yeah')
		dead_sound.play()
		return true

func _physics_process(delta: float):
	algae = get_tree().get_nodes_in_group("algae")
	var enemy_position = global_position
	closest_distance = enemy_position.distance_to(algae[0].global_position)
	closest_target = algae[0].global_position
	for alga in algae:
		if alga.global_position.distance_to(enemy_position) <= closest_distance:
			closest_target = alga.global_position
	var direction = global_position.direction_to(closest_target)
	velocity = direction*movement_speed
	if self.has_method('die'):
		die()
	move_and_slide()


	
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_viewport_rect().has_point(to_local(event.position)):
			pressed = true
			print('bruh')




func _on_death_finished() -> void:
	queue_free()
