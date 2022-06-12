extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.volume_db = Options.volume
	if Options.volumeDisabled == 0:
		self.set_stream_paused(true)
	else:
		self.set_stream_paused(false)
	 #Options.volumeDisabled

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
