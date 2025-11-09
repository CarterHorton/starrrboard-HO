extends Control

#establish variables
@onready var player: CharacterBody2D = $player
var game_manager = GameManager
var fireAdd = 3
var fireBase = 5
var speedAdd = 3
var speedBase = 5
var blackHoleAdd=3
var blackHoleBase=5

func _on_fire_pressed() -> void:
	if game_manager.score <= fireAdd:
		game_manager.score-=fireBase
		fireBase+=fireAdd
		fireAdd+=fireAdd
		player.cannonTimer-=0.1
		$Node/fire.text = str(fireBase)+"$"
	else:
		pass


func _on_ship_pressed() -> void:
	pass # Replace with function body.


func _on_blackhole_pressed() -> void:
	pass # Replace with function body.



func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")
