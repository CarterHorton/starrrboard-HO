extends CharacterBody2D

signal laser_shot(laser)

@export var acceleration := 10
@export var max_speed := 350
@export var rotation_speed :=200
@onready var camera_2d: Camera2D = $Camera2D
@onready var gun = $gun
@onready var thruster: AnimatedSprite2D = $Sprite2D/AnimatedSprite2D

var laser_scene = preload("res://scenes/laser.tscn")
var shoot_cd = false

func _process(delta):
	if Input.is_action_pressed("shoot"):
		if !shoot_cd:
			shoot_cd=true
			shoot_laser()
			await get_tree().create_timer(1).timeout
			shoot_cd=false
 
func _physics_process(delta: float) -> void:
	
	var input_vector := Vector2(0,Input.get_axis("move_forward","move_backward"))
	velocity += input_vector.rotated(rotation)*acceleration
	velocity = velocity.limit_length(max_speed)
	if velocity:
		thruster.speed_scale = velocity.length()/400
		thruster.play("thrusting")
	else:
		thruster.play("idle")
	if Input.is_action_pressed("rotate_right"):
		rotate(deg_to_rad(rotation_speed*delta))
	if Input.is_action_pressed("rotate_left"):
		rotate(deg_to_rad(-rotation_speed*delta))
	if input_vector.y == 0:
		velocity = velocity.move_toward(Vector2.ZERO,2)
	

	move_and_slide()

func shoot_laser():
	var l = laser_scene.instantiate()
	l.global_position = gun.global_position
	l.rotation=rotation
	emit_signal("laser_shot",l)
