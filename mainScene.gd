extends Node2D

onready var _area := $StationModul1X2Default

var scene = null
var toggle = false
var mouse_safe: Vector2 = get_global_mouse_position()
var instance
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
		if toggle:
			mouse_safe = get_global_mouse_position()
		if scene == null && instance == null:
			var scene = load("res://Station_Scenes/Station_Tile_1.tscn")
			instance = scene.instance()
			add_child(instance)


	if toggle:
		var mouse_pos: Vector2 = get_global_mouse_position()
		instance.position = Vector2(stepify(mouse_pos.x,16),stepify(mouse_pos.y,16))
