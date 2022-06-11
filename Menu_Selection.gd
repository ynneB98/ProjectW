extends Control
onready var test3 : AudioStreamPlayer = get_node("AudioStreamPlayer")


func _on_RetryGameButton_pressed():
	pass
var counter = 1

func _on_StartGameButton_pressed():
	get_tree().change_scene("res://mainScene.tscn")

func _on_QuitGameButton_pressed():
	get_tree().quit()


func _on_ThingsButton_pressed():
	get_tree().change_scene("res://things.tscn")


func _on_Button_pressed():
	var test1 : Button = $SoundButton 
	var texture = ImageTexture.new()
	texture.set_flags(0)
	#var test3 : AudioStreamPlayer = get_node("AudioStreamPlayer")
	
	
	match counter:
		1: 
			texture = load("res://Ressources/images/MainMenu/Sprite_Sound_Low.png")
			test1.set_button_icon(texture)
			Options.volume = -24 
			test3.volume_db = Options.volume
			counter = 2
		2:
			texture = load("res://Ressources/images/MainMenu/Sprite_Sound_Disabled.png")
			test1.set_button_icon(texture)
			Options.volumeDisabled = 0
			test3.playing = Options.volumeDisabled
			counter = 3
		3:
			texture = load("res://Ressources/images/MainMenu/Sprite_Sound_Loud.png")
			test1.set_button_icon(texture)
			Options.volumeDisabled = 1
			test3.playing = Options.volumeDisabled
			Options.volume = -12
			test3.volume_db = Options.volume 
			counter = 1 
	
	

