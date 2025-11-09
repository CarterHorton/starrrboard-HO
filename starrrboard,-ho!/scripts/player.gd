extends CharacterBody2D

#establish variables
signal laser_shot(laser)													#signal that gets sent whenever the laser shoots
@export var acceleration := 10												#acceleration constant
@export var rotation_speed :=200											#max rotation speed constant
@onready var camera_2d: Camera2D = $Camera2D								#access to camera node
@onready var gun = $gun														#access to gun node
@onready var thruster: AnimatedSprite2D = $Sprite2D/AnimatedSprite2D		#access to thruster node
var laser_scene = preload("res://scenes/laser.tscn")						#preloads the laser to get fired
var shoot_cd = false														#a boolean for if the cannon can get fired again

#establish changeable variables
var cannonTimer = 1															#timer to switch the boolean
@export var max_speed := 350												#max speed constant

#this function is how the actual cannonball if fired
func _process(_delta):
	if Input.is_action_pressed("shoot"):
		if !shoot_cd:
			shoot_cd=true
			shoot_laser()
			await get_tree().create_timer(1).timeout
			shoot_cd=false
 
#this is how the ship moves
func _physics_process(delta: float) -> void:
	#get input direction
	var input_vector := Vector2(0,Input.get_axis("move_forward","move_backward"))
	#apply it
	velocity += input_vector.rotated(rotation)*acceleration
	velocity = velocity.limit_length(max_speed)
	
	#used to play animation
	if velocity:
		thruster.speed_scale = velocity.length()/400
		thruster.play("thrusting")
	else:
		thruster.play("idle")
	#rotation for the camera
	if Input.is_action_pressed("rotate_right"):
		rotate(deg_to_rad(rotation_speed*delta))
	if Input.is_action_pressed("rotate_left"):
		rotate(deg_to_rad(-rotation_speed*delta))
	if input_vector.y == 0:
		velocity = velocity.move_toward(Vector2.ZERO,2)
	

	move_and_slide()
#the call to shoot the laser
func shoot_laser():
	var l = laser_scene.instantiate()
	l.global_position = gun.global_position
	l.rotation=rotation
	emit_signal("laser_shot",l)
