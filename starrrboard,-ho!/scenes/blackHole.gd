extends Area2D

@export var scaling:float = 1.0
@export var base_radius: float = 40.0
@export var glow_thickness: float = 12.0
@export var pulse_speed: float = 2.0
@export var pulse_amount: float = 0.3

var time_passed: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scale = Vector2(scaling, scaling)
	add_to_group("blackHole")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_passed += delta
	queue_redraw()  # Redraw every frame for animation

func _draw():
	var radius = base_radius
	# Outer faint glow (semi-transparent)
	var outer_color = Color(0.8, 0.0, 1.0, 0.078)  # Purple, 15% opacity
	draw_circle(Vector2.ZERO, radius + glow_thickness, outer_color)
