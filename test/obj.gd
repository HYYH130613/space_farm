extends Area2D

var showInterationLabel = false


func _process(delta: float):
	$Label.visible = showInterationLabel
	
	if showInterationLabel && Input.is_action_just_pressed('Interaction'):
		queue_free()


func _on_body_entered(body: Node2D):
	if body is Player: showInterationLabel = true


func _on_body_exited(body: Node2D):
	if body is Player: showInterationLabel = false
