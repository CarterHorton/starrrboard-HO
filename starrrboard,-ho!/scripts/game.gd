extends Node2D

@onready var lasers = $lasers
@onready var player = $player

func _ready() -> void:
	player.connect("laser_shot", _on_player_laser_shot)

func _on_player_laser_shot(laser):
	lasers.add_child(laser)
 
