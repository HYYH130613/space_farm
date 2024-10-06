extends Node



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var len = get_tree().get_node_count_in_group("algae")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(len)
