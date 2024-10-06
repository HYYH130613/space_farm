extends StaticBody2D

@onready var pscene = load("res://scenes/algae_container_view.tscn")
@onready var interaction_area = $Sprite2D/InteractionArea
@onready var algae_container_view = $algae_container_view

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	algae_container_view.visible = false
	interaction_area.interact = Callable(self, 'interact')
	

func interact():
	#algae_container_view.visible = true
	get_tree().change_scene_to_packed(pscene)


func _on_interaction_area_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_interaction_area_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
