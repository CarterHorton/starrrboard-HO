extends Area2D

@onready var timer = $Timer
var timerStarted = false

# Store the last known closest scrap
var clothedScrap = null
# Called when the node enters the scene tree for the first time.
func _on_ready() -> void:
	timer.one_shot = true
	

func _ready():
	timer.timeout.connect(_on_timer_timeout)
	visible = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# If the velocity is lower and 0.5 for 3 seconds
	var currVelocity = get_parent().velocity.length()
	if currVelocity <= 0.5 and not timerStarted:
		timer.wait_time = 3
		timer.start()
		timerStarted = true
	elif currVelocity >= 0.5 && timerStarted:
		timerStarted = false
		timer.stop()
		visible = false

# Find the closest scrap the player <->
# Take the direction from the player 
# Send out a one second ping in the direction 

func _on_timer_timeout() -> void:
	var currVelocity = get_parent().velocity.length()
	if currVelocity <= 0.5:
		clothedScrap = findScrap()
		pingScrap()

func findScrap() -> Area2D:
	# Get all of the scrap items in the group Scrap
	var scraps = get_tree().get_nodes_in_group("Scrap")
	if scraps.is_empty():
		print("No scraps?!?")
		return null
	
	var myPOS = get_parent().global_position
	var closestScrap = null
	var nearestDistance = INF
	
	for scrap in scraps:
		var dist = myPOS.distance_to(scrap.global_position)
		if dist < nearestDistance:
			global_position = get_parent().global_position
			nearestDistance = dist
			closestScrap = scrap
				
	print("Closest Scrap is: ", nearestDistance, " away")
	return closestScrap
	
func pingScrap() -> void:
	# Start the ping object at player, global position
	var direction = (clothedScrap.global_position - global_position).normalized()
	global_position += direction * 50.0
	visible = true
	
	
	
	
