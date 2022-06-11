extends Node2D

onready var _area 
onready var _onClick = get_node('_onClick')

var scene = null
var toggle = false
var instance
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	#_onClick.connect("type",self, "ClickeventHandler")
	EventBus.connect("type",self,"ClickEventHandler")
	pass # Replace with function body.

#func grid_snap() -> void:
#	yield(_input(event), "completed")
#	var mouse_pos: Vector2 = get_global_mouse_position()
#	_area.position = Vector2(stepify(mouse_pos.x,128),stepify(mouse_pos.y,128))


func ClickEventHandler(module_type):
	print(module_type[0])
	pass


func _process(delta):

#	if Input.is_action_just_pressed("ui_select_Module"):
#		toggle = !toggle
#		if scene == null && instance == null:
#			var scene = load("res://Station_Scenes/Station_Tile_1.tscn")
#			instance = scene.instance()
#			add_child(instance)


	if toggle:
		var mouse_pos: Vector2 = get_global_mouse_position()
		instance.position = Vector2(stepify(mouse_pos.x,16),stepify(mouse_pos.y,16))

