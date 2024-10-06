extends StaticBody2D

@onready var interaction_area = $Sprite2D/InteractionArea
@onready var algae_container_view = $algae_container_view

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	algae_container_view.visible = false
	interaction_area.interact = Callable(self, 'interact')
	

func interact():
	algae_container_view.visible = true
