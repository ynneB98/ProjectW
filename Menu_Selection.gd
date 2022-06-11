extends Control


func _on_StartGameButton_pressed():
	get_tree().change_scene("res://mainScene.tscn")


func _on_ThingsButton_pressed():
	get_tree().change_scene("res://things.tscn")


func _on_QuitGameButton_pressed():
	get_tree().quit()
