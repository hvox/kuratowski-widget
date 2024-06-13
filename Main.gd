extends Node2D

@onready var window: Window = get_window()
var window_size: Vector2i = Vector2(128, 128)


func _ready():
	window.size = Vector2(128, 128)


func _process(delta):
	if Input.get_mouse_button_mask() & MOUSE_BUTTON_LEFT:
		window.position = DisplayServer.mouse_get_position() - window_size / 2
