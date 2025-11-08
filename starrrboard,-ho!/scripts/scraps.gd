extends CollisionObject2D
# Author: Carter Horton
# Date: 11 - 8 - 2025
# Title: Scraps script
# Description:
# ----- Settings -----
@export var scrapSpeed: float = 40.0 # Variable speed controler
@export var maxVals: Vector2 = Vector2(1280,720) # Maximum value numbers
@export var minVals: Vector2 = Vector2(0,0) # Minumum value numbers
# ----- Variables ------
var target: Vector2 # Refrence variable for where the peice is going
var rng = RandomNumberGenerator.new() # OS time to create random ints

# This function creates a random vector and assigns it to target variable
func pickTarget() -> void:
	target = Vector2(
		rng.randf_range(minVals.x, maxVals.x),
		rng.randf_range(minVals.y, maxVals.y)
	)
	# Print the location to terminal
	print("Target is: ", target)

func _on_ready() -> void:
	rng.randomize() # Instanciate a random capture
	pickTarget() # Pick a target to approach
	pass # Replace with function body.

# Move to new frame (RUN IN _process)
func moveToTarget(delta: float) -> void:
	# ----- Find Point -----
	var direction = (target - global_position).normalized()
	var distanceThisFrame = scrapSpeed * delta
	if global_position.distance_to(target) <= distanceThisFrame:
		global_position = target
		pickTarget()
	else:
		global_position += direction * distanceThisFrame

func _process(delta: float) -> void:
	moveToTarget(delta)
	
	
	
	
	
	
	
	
	
	
	
	
	
