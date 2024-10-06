extends Node2D

@onready var name_input = $CanvasLayer/MarginContainer/PanelContainer/MarginContainer/VBoxContainer/Username
@onready var password_input = $CanvasLayer/MarginContainer/PanelContainer/MarginContainer/VBoxContainer/Password
@onready var submit_button = $CanvasLayer/MarginContainer/PanelContainer/MarginContainer/VBoxContainer/Button

func _ready():
	# Изначально отключаем кнопку
	submit_button.disabled = true

	# Подписываемся на событие изменения текста
	name_input = Callable(self, "_check_inputs")
	password_input = Callable(self, "_check_inputs")
	

func _check_inputs():
	# Проверяем, заполнены ли оба поля
	if name_input.text != "" and password_input.text != "":
		submit_button.disabled = false
	else:
		submit_button.disabled = true


func _on_button_pressed():
	queue_free()
