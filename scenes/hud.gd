extends Control

@onready var score = $score:
	set(value):
		score.text = "Enemies killed: " + str(value)
		
