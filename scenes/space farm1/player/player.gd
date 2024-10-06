extends CharacterBody2D
class_name Player

@onready var animated_spride_2d = $AnimatedSprite2D

@export var movement_speed = 150

enum State { Idle, Walk}
var current_state : State

func _ready():
	current_state = State.Idle


func _physics_process(delta : float):
	player_idle(delta)
	movement(delta)
  
	move_and_slide()
  
	player_animation(delta)


func player_idle(delta : float):
	current_state = State.Idle


func movement(delta : float):
	var x_mov = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y_mov = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	var mov = Vector2(x_mov, y_mov)
	var direction = Input.get_axis("move_left", 'move_right')
  
	if direction:
		velocity.x = direction * movement_speed
	else:
		velocity.x = move_toward(velocity.x, 0, movement_speed)
	
	if direction != 0:
		current_state = State.Walk
		animated_spride_2d.flip_h = false if direction > 0 else true
	velocity = mov.normalized()*movement_speed
	
	
func player_animation(delta : float):
	if current_state == State.Idle:
		animated_spride_2d.play('idle')
	elif current_state == State.Walk:
		animated_spride_2d.play('walk')
