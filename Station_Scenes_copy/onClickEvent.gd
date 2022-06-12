extends Node2D

signal  type
var data_array = []
var module_type
var active_state
var station_type
var energy
var score

func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("ui_select_Module"):
		data_array[0] = module_type
		data_array[1] = active_state
		emit_signal("type", data_array)
		EventBus.broadcast_signal("type",[module_type])
		var clickedObject = self;
		#print(clickedObject.module_type)

func setModuleType (module_type):
	self.module_type = module_type
	
	
func _init(_module_type = 0, _active_state = 0, _station_type = 0, _energy = 0, _score = 0).():
	module_type = _module_type
	active_state = _active_state
	station_type = _station_type
	energy = _energy
	score = _score
