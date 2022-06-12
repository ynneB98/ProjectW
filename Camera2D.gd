extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_WHEEL_UP and event.pressed:
			# Hier Fehlt Kamera Zoom
			#if self.get_zoom()
			self.set_zoom(self.get_zoom()-Vector2(0.01,0.01))
			print(self.get_camera_position())	
			
			
		if event.button_index == BUTTON_WHEEL_DOWN and event.pressed:
			# Hier Fehlt Kamera DeZoom
			print("Wheel down")	
			if self.get_zoom() == Vector2(1,1):
				pass
			else:	
				self.set_zoom(self.get_zoom()+Vector2(0.01,0.01))
			
	if event is InputEventKey and event.pressed:
		
		if event.scancode == KEY_W:
			print("W")
			self.set_offset(self.get_offset()+Vector2(0,-2))
		if event.scancode == KEY_S:
			print("S")
			self.set_offset(self.get_offset()+Vector2(0,2))
		if event.scancode == KEY_A:
			print("A")
			self.set_offset(self.get_offset()+Vector2(-2,0))
		if event.scancode == KEY_D:
			print("D")
			self.set_offset(self.get_offset()+Vector2(2,0))
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
