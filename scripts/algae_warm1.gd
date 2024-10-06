extends RigidBody2D

var mouse_in := false
var pressed := false
@export var hp = 2
@onready var crunch = $"../AudioStreamPlayer2D"



func _process(delta: float) -> void:
	if pressed:
		apply_central_impulse( (((get_global_mouse_position() - global_position)) / 10))
		
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click") and mouse_in:
		pressed = true
	if event.is_action_released("click"):
		pressed = false
	
func _on_mouse_entered() -> void:
	mouse_in = true


func _on_mouse_exited() -> void:
	mouse_in = false


func _on_hurt_box_4_hurt(damage: Variant) -> void:
	hp -= damage
	crunch.play()
	if hp <= 0:
		queue_free()


func _on_hurt_box_3_hurt(damage: Variant) -> void:
	hp -= damage
	crunch.play()
	if hp <= 0:
		queue_free()



func _on_hurt_box_2_hurt(damage: Variant) -> void:
	hp -= damage
	crunch.play()
	if hp <= 0:
		queue_free()


func _on_hurt_box_hurt(damage: Variant) -> void:
	hp -= damage
	crunch.play()
	if hp <= 0:
		queue_free()
