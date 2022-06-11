extends Control
<<<<<<< Updated upstream

func _on_RetryGameButton_pressed():
=======
	#var iconLoud = preoload("res://Ressources/images/MainMenu/Sprite_Sound_Disabled.png")
var counter = 1

func _on_StartGameButton_pressed():
>>>>>>> Stashed changes
	get_tree().change_scene("res://mainScene.tscn")

func _on_QuitGameButton_pressed():
	get_tree().quit()

<<<<<<< Updated upstream
func _on_StartGameButton_pressed():
	get_tree().change_scene("res://mainScene.tscn")

func _on_ThingsButton_pressed():
	get_tree().change_scene("res://things.tscn")
=======

func _on_Button_pressed():
	var test1 : Button = $SoundButton 
	var texture = ImageTexture.new()
	texture.set_flags(0)
	var test3 : AudioStreamPlayer = get_node("AudioStreamPlayer")
	
	
	match counter:
		1: 
			texture = load("res://Ressources/images/MainMenu/Sprite_Sound_Low.png")
			test1.set_button_icon(texture)
			test3.volume_db = -24 
			counter = 2
		2:
			texture = load("res://Ressources/images/MainMenu/Sprite_Sound_Disabled.png")
			test1.set_button_icon(texture)
			test3.playing = 0
			counter = 3
		3:
			texture = load("res://Ressources/images/MainMenu/Sprite_Sound_Loud.png")
			test1.set_button_icon(texture)
			test3.playing = 1
			test3.volume_db = -12 
			counter = 1 
	
	
>>>>>>> Stashed changes
