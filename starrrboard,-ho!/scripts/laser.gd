extends Area2D

@export var speed := 500.0
var movement_vector := Vector2(0,-1)
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _physics_process(delta: float) -> void:
	global_position += movement_vector.rotated(rotation)* speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	await get_tree().create_timer(1.5).timeout     
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	animation_player.play("shoot")
