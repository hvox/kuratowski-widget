extends Node2D

@onready var sprite = $Sprite
@onready var window: Window = get_window()
var opacity_delta = 0.05
var window_size: Vector2i = Vector2(128, 128)
var prev_mouse_position: Vector2i


func _ready():
	window.size = Vector2(128, 128)


func _process(delta):
	var mouse_position = DisplayServer.mouse_get_position()
	var mouse_button_mask = Input.get_mouse_button_mask()
	if mouse_button_mask & MOUSE_BUTTON_LEFT:
		window.position += mouse_position - prev_mouse_position
	prev_mouse_position = mouse_position

func _input(event):
	if not event is InputEventMouseButton:
		return
	if event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed:
		sprite.modulate.a = clamp(sprite.modulate.a + opacity_delta, 0, 1)
	if event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.pressed:
		sprite.modulate.a = clamp(sprite.modulate.a - opacity_delta, 0, 1)
