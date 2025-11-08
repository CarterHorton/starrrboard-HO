extends Area2D
# Author: Carter Horton
# Date: 11 - 8 - 2025
# Title: Scraps
# Description: Moves the whole body around the screen
# ----- Settings -----
@export var scrapSpeed: float = 40.0 # Variable speed controler
@export var maxVals: Vector2 = Vector2(1280,720) # Maximum value numbers
@export var minVals: Vector2 = Vector2(0,0) # Minumum value numbers
@export var custom_Texture: Texture2D:
	set(value):
		$SpriteTexture.texture = value
		custom_Texture = value

# ----- Variables ------
var target: Vector2 # Refrence variable for where the peice is going
var rng = RandomNumberGenerator.new() # OS time to create random ints

# This function creates a random vector and assigns it to target variable
func pickTarget() -> void:
	target = Vector2(
		rng.randf_range(minVals.x, maxVals.x),
		rng.randf_range(minVals.y, maxVals.y)
	)

func _on_ready() -> void:
	rng.randomize() # Instanciate a random capture
	pickTarget() # Pick a target to approach
	global_position = target
	pass # Replace with function body.

# Move to new frame (RUN IN _process)
func moveToTarget(delta: float) -> void:
	# ----- Find Point -----
	# Find direction by normalizing the difference
	var direction = (target - global_position).normalized()
	# Use delta so that the speed accounts for the frame
	var distanceThisFrame = scrapSpeed * delta
	# if the object would travel past the distance to target
	if global_position.distance_to(target) <= distanceThisFrame:
		global_position = target # Set the position to the target position
		pickTarget() # Pick a new target to travel to
	else:
		global_position += direction * distanceThisFrame # Add to globalposition

# This function runs on every single frame and passes delta as time since last
func _process(delta: float) -> void:
	moveToTarget(delta)

func _on_area_entered(area: Area2D) -> void:
	print("collided")
	pass # Replace with function body.
