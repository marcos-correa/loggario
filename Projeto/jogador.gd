extends KinematicBody2D

export var move_speed = 250
export var stop_distance = 20

var playercoord = Vector2.ZERO

func _process(delta):
	_look_at_mouse()
	_move_to_mouse()
	playercoord = get_position()

func _look_at_mouse():
	look_at(get_global_mouse_position())
	rotation_degrees = rotation_degrees + 90

func _move_to_mouse():
	if get_position().distance_to(get_global_mouse_position()) > stop_distance:
		var direction = get_global_mouse_position() - position
		move_and_slide(direction)
