extends Control

onready var label : Label = $Label
#onready var audioplayer : AudioStreamPlayer = get_node("AudioStreamPlayer")
var size = 16
var dynamic_font = DynamicFont.new()
#func _ready():
	#var audioplayer : AudioStreamPlayer = get_node("AudioStreamPlayer")
	#audioplayer.volume_db = Options.volume
	#audioplayer.playing = Options.volumeDisabled
	#print(Options.volumeDisabled)
	#print(Options.volume)
	#print("klappt")
func _input(event):
	# Spacebar to enlarge ~THINGS~
	if Input.is_key_pressed(KEY_SPACE):
		size += 1
		dynamic_font.font_data = load("res://Ressources/font/Savior1.ttf")
		
		dynamic_font.size = size
		size += 2
		dynamic_font.outline_size = 1
		dynamic_font.outline_color = "#000000"
		label.grow_horizontal = Control.GROW_DIRECTION_BOTH
		label.grow_vertical = Control.GROW_DIRECTION_BOTH
		
		label.add_font_override("font", dynamic_font)



