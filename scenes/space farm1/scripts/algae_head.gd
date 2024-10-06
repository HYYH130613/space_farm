extends RigidBody2D

var mouse_in := false
var pressed := false

func _process(delta: float) -> void:
	if pressed:
		apply_central_impulse( (((get_global_mouse_position() - global_position)) / 10))
	print(pressed, mouse_in)
		
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click") and mouse_in:
		pressed = true
	if event.is_action_released("click"):
		pressed = false
	
func _on_mouse_entered() -> void:
	mouse_in = true


func _on_mouse_exited() -> void:
	mouse_in = false
