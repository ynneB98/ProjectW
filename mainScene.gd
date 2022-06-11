extends Node2D

onready var _area 
onready var _onClick = get_node('_onClick')

var scene = null
var toggle = false
var instance
var instance2
var inventory_toggle = true 
var rotation_safe = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	#_onClick.connect("type",self, "ClickeventHandler")
	EventBus.connect("inventory",self,"invent_handler")
	EventBus.connect("type",self,"ClickEventHandler")
	EventBus.connect("cancel_select",self,"CancelEventHandler")
	pass # Replace with function body.

#func grid_snap() -> void:
#	yield(_input(event), "completed")
#	var mouse_pos: Vector2 = get_global_mouse_position()
#	_area.position = Vector2(stepify(mouse_pos.x,128),stepify(mouse_pos.y,128))

func invent_handler():
	inventory_toggle =  !inventory_toggle
	pass

func CancelEventHandler(module_type):
	self.remove_child(instance)

func ClickEventHandler(module_type):

	if !toggle:
		if module_type[1] == 1:
			var scene_string = "res://Station_Scenes/Station_Tile_" + str(module_type[0]) + ".tscn"
			var scene = load(scene_string)
			instance = scene.instance()
			instance.z_index = 200
			add_child(instance)
			toggle = true
	else:
		var inv_y = self.get_child(1).get_child(0).get_child(0).get_rect().size.y
		var inv_x = self.get_child(1).get_child(0).get_child(0).get_rect().size.x
		var inv_x_pos = self.get_child(1).get_child(0).get_child(0).global_position.x
		var inv_y_pos = self.get_child(1).get_child(0).get_child(0).global_position.y
		
		var mouse_pos: Vector2 = get_global_mouse_position()		
		var buttonState = self.get_child(1).get_child(0).get_child(1).text
		
		if (inventory_toggle && mouse_pos.x > inv_x_pos-(inv_x/2) && mouse_pos.x < inv_x_pos+(inv_x/2) && 
		mouse_pos.y > inv_y_pos-(inv_y/2) && mouse_pos.y < inv_y_pos+(inv_y/2) && buttonState == "Close"):
			
			pass
			
		else: 
			self.remove_child(instance)
			toggle = false
			var scene_string = "res://Station_Scenes_copy/Station_Tile_" + str(module_type[0]) + ".tscn"
			var scene = load(scene_string)
			instance2 = scene.instance()
			add_child(instance2)
			instance2.position = Vector2(stepify(mouse_pos.x,16),stepify(mouse_pos.y,16))
			instance2.rotation = rotation_safe
			rotation_safe = 0
			
			
		

func _process(delta):
 
	if Input.is_action_just_pressed("ui_Module_rotation"):
		instance.rotation  += PI/2
		rotation_safe += PI/2
		pass
	

	if toggle:
		var mouse_pos: Vector2 = get_global_mouse_position()
		instance.position = Vector2(stepify(mouse_pos.x,16),stepify(mouse_pos.y,16))

