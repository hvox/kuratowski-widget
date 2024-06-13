extends Node2D

@onready var window: Window = get_window()
var window_size: Vector2i = Vector2(128, 128)
var prev_mouse_position: Vector2i


func _ready():
	window.size = Vector2(128, 128)


func _process(delta):
	var mouse_position = DisplayServer.mouse_get_position()
	if Input.get_mouse_button_mask() & MOUSE_BUTTON_LEFT:
		window.position += mouse_position - prev_mouse_position
	prev_mouse_position = mouse_position
