extends Node2D

onready var _area 
onready var _onClick = get_node('_onClick')

var scene = null
var toggle = false
var instance : Area2D
var instance2
var inventory_toggle = true 
var rotation_safe = 0
var elapsed = 0
var is_rotating = 0
var lastClickedElement
var isPlacable 
var currentLocation = Vector2(0,0)
var energy = 55
var score = 0

var childrenPosition = [-312,-104,104,312]

# Called when the node enters the scene tree for the first time.
func _ready():
	
	$RessourceOverlay/EnergyLabel/EnergyCount.text = String(energy)
	$RessourceOverlay/ScoreLabel/ScoreCount.text = String(score)
	
	#_onClick.connect("type",self, "ClickeventHandler")
	EventBus.connect("inventory",self,"invent_handler")
	EventBus.connect("type",self,"ClickEventHandler")
	EventBus.connect("cancel_select",self,"CancelEventHandler")
	pass # Replace with function body.

#func grid_snap() -> void:
#	yield(_input(event), "completed")
#	var mouse_pos: Vector2 = get_global_mouse_position()
#	_area.position = Vector2(stepify(mouse_pos.x,128),stepify(mouse_pos.y,128))

func invent_handler():
	inventory_toggle =  !inventory_toggle
	pass

func CancelEventHandler(module_type):
	self.remove_child(instance)
	toggle = false

func ClickEventHandler(module_type):
	
	if !toggle:
		
		lastClickedElement = module_type[2]
		
		if module_type[1] == 1:
			var scene_string = "res://Station_Scenes/Station_Tile_" + str(module_type[0]) + ".tscn"
			var scene = load(scene_string)
			instance = scene.instance()
			instance.z_index = 200
			add_child(instance)
			toggle = true
	else:
		var inv_y = self.get_child(1).get_child(0).get_child(0).get_rect().size.y
		var inv_x = self.get_child(1).get_child(0).get_child(0).get_rect().size.x
		var inv_x_pos = self.get_child(1).get_child(0).get_child(0).global_position.x
		var inv_y_pos = self.get_child(1).get_child(0).get_child(0).global_position.y
		
		var mouse_pos: Vector2 = get_global_mouse_position()		
		var buttonState = self.get_child(1).get_child(0).get_child(1).text
		
		if (inventory_toggle && mouse_pos.x > inv_x_pos-(inv_x/2) && mouse_pos.x < inv_x_pos+(inv_x/2) && 
		mouse_pos.y > inv_y_pos-(inv_y/2) && mouse_pos.y < inv_y_pos+(inv_y/2) && buttonState == "Close"):
			
			pass
			
		else: 
			
			if(isPlacable == true):
				
				var scene_string = "res://Station_Scenes_copy/Station_Tile_" + str(module_type[0]) + ".tscn"
				var scene = load(scene_string)
				instance2 = scene.instance()
				
				print (energy)
				print(instance2.energy)
				
				
				#Score + Energyverwaltung
				if(energy >= (instance2.energy * -1)):
					
					$RessourceOverlay/EnergyLabel.add_color_override("font_color", "#ffffff")
					
					energy += instance2.energy
					$RessourceOverlay/EnergyLabel/EnergyCount.text = String(energy)
					
					score += instance2.score
					$RessourceOverlay/ScoreLabel/ScoreCount.text = String(score)
			
					$Inventory/Inventory/Items.remove_child(lastClickedElement)
					fillInventory()
					
					self.remove_child(instance)
					toggle = false
					
					self.find_node("ModuleGroup").add_child(instance2)
					instance2.position = Vector2(stepify(mouse_pos.x,18),stepify(mouse_pos.y,18))
					instance2.rotation = rotation_safe
					rotation_safe = 0
					
				else:
					$RessourceOverlay/EnergyLabel.add_color_override("font_color", "#ff0000")
									
func _process(delta):
	
	elapsed += delta
	
	if elapsed > 0.05 && toggle:
		elapsed  = 0
		var vecInstance : Vector2 = Vector2(instance.position.x, instance.position.y)
		var instanceCollisions = instance.get_child(2).get_children()
			
			
		# Prüfung auf Kollision, ansonsten Instance = roter Shader, wenn passt = grüner Shader
		
		for module in self.find_node("ModuleGroup").get_children():
			var vec2 : Vector2 = Vector2(module.position.x, module.position.y) 
				
			var distance = vecInstance.distance_to(vec2)
				
			if(distance <= 300):
					
				var i = 1
					
				for collision in module.get_child(2).get_children():
						
					# print("Aktueller Vergleich: " , i)
					i += 1
						
					var colli : CollisionShape2D = collision
						
					var x = colli.global_position.x
					var y = colli.global_position.y
						
					for instanceColli in instanceCollisions:
						
										
						var localY
						var localX 
						
						if(is_rotating == 0):
							localY = instanceColli.position.y
							localX = instanceColli.position.x
						else:
							localY = instanceColli.position.x
							localX = instanceColli.position.y
												
						if(instanceColli.get_parent().get_parent().global_position.y + localY  == y && 
							instanceColli.get_parent().get_parent().global_position.x + localX  == x):
							#print("YIPPIE")
							
							isPlacable = true
							
							currentLocation = instance.position							
							
								
							#Grüne Outline
							var currentSprite = instance.get_children()[0]
							var shader : Shader = load("res://Ressources/shaders/outline_green.tres")
							var shaderMaterial : ShaderMaterial = ShaderMaterial.new()
							shaderMaterial.shader = shader
							currentSprite.material = shaderMaterial
								
							break
						
						elif(currentLocation != instance.position):
							
							#print("BOO")
							
							isPlacable = false
							
							#Rote Outline
							var currentSprite = instance.get_children()[0]
							var shader : Shader = load("res://Ressources/shaders/outline_red.tres")
							var shaderMaterial : ShaderMaterial = ShaderMaterial.new()
							shaderMaterial.shader = shader							
							currentSprite.material = shaderMaterial
					
				pass
				
	if Input.is_action_just_pressed("ui_Module_rotation"):
		
		instance.rotation  += PI/2
		rotation_safe += PI/2
		if(is_rotating == 1):
			is_rotating = 0
		else:
			is_rotating = 1
		currentLocation = Vector2(0,0)
		pass
	

	if toggle:
		var mouse_pos: Vector2 = get_global_mouse_position()
		instance.position = Vector2(stepify(mouse_pos.x,18),stepify(mouse_pos.y,18))
		
		
	# Check auf Game Over
	var canContinue = false
	for item in $Inventory/Inventory/Items.get_children():
		
		var itemEnergy = item.energy
		
		if((itemEnergy * -1) <= energy):
			canContinue = true
			break
		
	if(canContinue == false):
		get_tree().change_scene("res://GameOver_Menu.tscn")
		
func fillInventory():
	
	var currentAmount = $Inventory/Inventory/Items.get_child_count()
	var neededToFill = 4 - currentAmount
	
	for position in childrenPosition:
		
		var exists = false
		
		for item in $Inventory/Inventory/Items.get_children():
			
			# [-312,-104,104,312]
			var possiblePosition = [-312,-104,104,312]
			
			if(position == item.position.x):
				
				exists = true
			
		if(exists == false):
			
			var random = int(rand_range(1, 14))
			
			var scene_string = "res://Station_Scenes/Station_Tile_" + String(random) + ".tscn"
			var scene = load(scene_string)
			var newItem : Area2D = scene.instance()
			$Inventory/Inventory/Items.add_child(newItem)
			newItem.position = Vector2(position, 0)
			newItem.scale = Vector2(2,2)
			
			
			
