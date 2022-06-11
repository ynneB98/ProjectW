extends Node2D

onready var _area 
onready var _onClick = get_node('_onClick')

var scene = null
var toggle = false
var instance
var instance2
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	#_onClick.connect("type",self, "ClickeventHandler")
	EventBus.connect("type",self,"ClickEventHandler")
	EventBus.connect("cancel_select",self,"CancelEventHandler")
	pass # Replace with function body.

#func grid_snap() -> void:
#	yield(_input(event), "completed")
#	var mouse_pos: Vector2 = get_global_mouse_position()
#	_area.position = Vector2(stepify(mouse_pos.x,128),stepify(mouse_pos.y,128))


func CancelEventHandler(module_type):
	self.remove_child(instance)

func ClickEventHandler(module_type):
	print(module_type[1])
	if !toggle:
		if module_type[1] == 1:
			var scene_string = "res://Station_Scenes/Station_Tile_" + str(module_type[0]) + ".tscn"
			var scene = load(scene_string)
			instance = scene.instance()
			add_child(instance)
			toggle = true
	else:
		toggle = false
		self.remove_child(instance)
		var mouse_pos: Vector2 = get_global_mouse_position()
		var scene_string = "res://Station_Scenes_copy/Station_Tile_" + str(module_type[0]) + ".tscn"
		var scene = load(scene_string)
		instance2 = scene.instance()
		add_child(instance2)
		instance2.position = Vector2(stepify(mouse_pos.x,16),stepify(mouse_pos.y,16))
		

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

