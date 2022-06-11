extends Area2D

signal  type
var module_type

func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("ui_select_Module"):
		emit_signal("type", module_type)
		var clickedObject = self;
		print(clickedObject.module_type)

func setModuleType (module_type):
	self.module_type = module_type
	
	
func _init(_module_type = 0).():
	module_type = _module_type
