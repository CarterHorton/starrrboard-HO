extends Node2D

#Establish variables
@onready var lasers = $lasers    #points to lasers node
@onready var player = $player	 #points to player node

#this function is to create the cannon that is shot
func _ready() -> void:
	player.connect("laser_shot", _on_player_laser_shot)

#this adds the laser into the lasers node as a child node
func _on_player_laser_shot(laser):
	lasers.add_child(laser)
 
