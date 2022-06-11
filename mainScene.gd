extends Node2D

onready var _area := $Station_Node

var toggle = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#func grid_snap() -> void:
#	yield(_input(event), "completed")
#	var mouse_pos: Vector2 = get_global_mouse_position()
#	_area.position = Vector2(stepify(mouse_pos.x,128),stepify(mouse_pos.y,128))

func _process(delta):
	if Input.is_action_just_pressed("ui_select_Module"):
		toggle = !toggle
	#if toggle == false:
	if toggle:
		var mouse_pos: Vector2 = get_global_mouse_position()
		_area.position = Vector2(stepify(mouse_pos.x,16),stepify(mouse_pos.y,16))