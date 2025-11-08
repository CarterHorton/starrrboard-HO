extends CharacterBody2D

@export var acceleration := 10

func _physics_process(delta: float) -> void:
	
	var input_vector := Vector2(0,Input.get_axis("move_forward","move_backward"))
	velocity += input_vector*acceleration
	move_and_slide()	


	var screen_size=get_viewport_rect().size
	if global_position.y < 0:
		global_position.y=screen_size.y
