extends CharacterBody2D

#signal laser_shot(laser)

@export var acceleration := 10
@export var max_speed := 350
@export var rotation_speed :=200
@onready var camera_2d: Camera2D = $Camera2D
@onready var gun = $gun

var laser_scene = preload("res://scenes/laser.tscn")
func _physics_process(delta: float) -> void:
	
	var input_vector := Vector2(0,Input.get_axis("move_forward","move_backward"))
	velocity += input_vector.rotated(rotation)*acceleration
	velocity = velocity.limit_length(max_speed)
	
	if Input.is_action_pressed("rotate_right"):
		rotate(deg_to_rad(rotation_speed*delta))
	if Input.is_action_pressed("rotate_left"):
		rotate(deg_to_rad(-rotation_speed*delta))
	if input_vector.y == 0:
		velocity = velocity.move_toward(Vector2.ZERO,2)
	

	move_and_slide()
