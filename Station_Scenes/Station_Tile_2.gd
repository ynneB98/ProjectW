extends Area2D

signal  type
var module_type = 2

func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("ui_select_Module"):
		emit_signal("type", module_type)
