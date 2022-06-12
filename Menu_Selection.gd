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
	var halbNormal = StyleBoxTexture.new()
	var halbHover = StyleBoxTexture.new()
	var halbPressed = StyleBoxTexture.new()
	var vollNormal = StyleBoxTexture.new()
	var vollHover = StyleBoxTexture.new()
	var vollPressed = StyleBoxTexture.new()
	var ausNormal = StyleBoxTexture.new()
	var ausHover = StyleBoxTexture.new()
	var ausPressed = StyleBoxTexture.new()
	texture.set_flags(0)
	
	match counter:
		1: 
			halbNormal = load("res://mute_button_styles/mutehalb_normal.tres") 
			test1.add_stylebox_override("normal", halbNormal)
			halbHover = load("res://mute_button_styles/mutehalb_hover.tres") 
			test1.add_stylebox_override("hover", halbHover)
			halbPressed = load("res://mute_button_styles/mutehalb_pressed.tres") 
			test1.add_stylebox_override("pressed", halbPressed)
			Options.volume = -24 
			test3.volume_db = Options.volume
			counter = 2
		2:
			ausNormal = load("res://mute_button_styles/muteaus_normal.tres") 
			test1.add_stylebox_override("normal", ausNormal)
			ausHover = load("res://mute_button_styles/muteaus_hover.tres") 
			test1.add_stylebox_override("hover", ausHover)
			ausPressed = load("res://mute_button_styles/muteaus_pressed.tres") 
			test1.add_stylebox_override("pressed", ausPressed)
			Options.volumeDisabled = 0
			test3.playing = Options.volumeDisabled
			counter = 3
		3:
			vollNormal = load("res://mute_button_styles/mutelaut_normal.tres") 
			test1.add_stylebox_override("normal", vollNormal)
			vollHover = load("res://mute_button_styles/mutelaut_hover.tres") 
			test1.add_stylebox_override("hover", vollHover)
			vollPressed = load("res://mute_button_styles/mutelaut_pressed.tres") 
			test1.add_stylebox_override("pressed", vollPressed)
			Options.volumeDisabled = 1
			test3.playing = Options.volumeDisabled
			Options.volume = -12
			test3.volume_db = Options.volume 
			counter = 1 
