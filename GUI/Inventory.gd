extends Control

onready var openCloseButton : Button = $Inventory/OpenCloseButton
onready var inventory = $Inventory


# bind function to button
func _ready():
	var _error = openCloseButton.connect("pressed", self, "_openCloseButton_pressed")
	
	if(_error != 0):
		push_error(_error)
		


func _input(event):
   # Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		print("Mouse Click/Unclick at: ", event.position)
	elif event is InputEventMouseMotion:
		print("Mouse Motion at: ", event.position)

	# Print the size of the viewport.
	print("Viewport Resolution is: ", get_viewport_rect().size)


# Open and close inventory menu
func _openCloseButton_pressed():
	
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



