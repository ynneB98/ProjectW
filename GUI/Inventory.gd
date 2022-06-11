extends Control

signal inventory

onready var openCloseButton : Button = $Inventory/OpenCloseButton
onready var inventory = $Inventory
var currentElement

# bind function to button
func _ready():
	var _error = openCloseButton.connect("pressed", self, "_openCloseButton_pressed")
	
	if(_error != 0):
		push_error(_error)
		


func _input(event):
   # Mouse in viewport coordinates.
	if event is InputEventMouseMotion:
		for elem in $Inventory/Items.get_children():
			
			if(currentElement != elem):
				var currentSprite : Sprite = elem.get_children()[0]
				var shaderMaterial : ShaderMaterial = ShaderMaterial.new()
				currentSprite.material = shaderMaterial
				
				currentElement = elem
				
			if(elem.position.x+24 > get_local_mouse_position().x && elem.position.x-24 < get_local_mouse_position().x && 
			elem.position.y+24 > get_local_mouse_position().y && elem.position.y-24 < get_local_mouse_position().y):
				
				if(currentElement == elem):
				
					var currentSprite : Sprite = elem.get_children()[0]
					var shader : Shader = load("res://Ressources/shaders/outline.tres")
					var shaderMaterial : ShaderMaterial = ShaderMaterial.new()
					shaderMaterial.shader = shader
					currentSprite.material = shaderMaterial
					
				currentElement = elem
	
# Open and close inventory menu
func _openCloseButton_pressed():
	
	EventBus.broadcast_signal("inventory",[])
	
	if(openCloseButton.text == "Close"):
		openCloseButton.text = "Open"
	else: 
		openCloseButton.text = "Close"
	
	# Get scaling and size of inventory to close menu
	var currentPosition = inventory.position.y
	var inventoryHeight = $Inventory/InventorySprite.scale.y * $Inventory/InventorySprite.get_rect().size.y
	
	if(currentPosition <= 0):
		inventory.position.y = inventoryHeight - 10
	else:
		inventory.position.y = 0



