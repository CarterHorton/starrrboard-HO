extends Area2D

#variables
@export var speed := 500.0												#sets base speed
var movement_vector := Vector2(0,-1)									#sets movement_vector 
@onready var animation_player: AnimationPlayer = $AnimationPlayer		#access to the AnimationPlayer node

#this function sets the position of the laser
func _physics_process(delta: float) -> void:
	global_position += movement_vector.rotated(rotation)* speed * delta

#this function waits until the audio plays, then deletes the instance of the node
func _on_visible_on_screen_notifier_2d_screen_exited():
	await get_tree().create_timer(1.5-animation_player.current_animation_length).timeout     
	queue_free()


#this function plays the audio as soon as it appears on the canvas
func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	animation_player.play("shoot")
