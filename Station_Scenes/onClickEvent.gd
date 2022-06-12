extends Node2D

signal  type
signal  cancel_select
var data_array = []
var module_type
var active_state
var station_type

func _on_Area2D_input_event(viewport, event, shape_idx):
	
	if Input.is_action_just_pressed("ui_mouse_cancel"):
		EventBus.broadcast_signal("cancel_select",[module_type,active_state])
		
	if Input.is_action_just_pressed("ui_select_Module"):
		EventBus.broadcast_signal("type",[module_type,active_state, self])
		var clickedObject = self;
		
func setModuleType (module_type):
	self.module_type = module_type
		
func _init(_module_type = 0, _active_state = 0, _station_type = 0).():
	module_type = _module_type
	active_state = _active_state
	station_type = _station_type


#Station Type 0 = Forschungspunkte
#Station Type 1 = Elektritzität
