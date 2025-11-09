extends Area2D

# Store the last known closest scrap
var clothedHub = null
	

func _ready():
	visible = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# If the velocity is lower and 0.5 for 3 seconds
	global_position = get_parent().global_position
	clothedHub = findHub()
	pingHub()

func findHub() -> Area2D:
	# Get all of the scrap items in the group Scrap
	var hub = get_tree().get_first_node_in_group("Hub")
	if hub == null:
		print("No Hub?!?")
		return null
	
	return hub
	
func pingHub() -> void:
	# Start the ping object at player, global position
	var direction = (clothedHub.global_position - global_position).normalized()
	global_position += direction * 50.0
	visible = true
	
	
	
	
