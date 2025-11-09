extends Area2D

@onready var game_controller: GameController = get_node("/root").get_child(0) as GameController
#this is used to pull up the shop menu whenever you run into the hub
func _on_body_entered(_body: Node2D) -> void:
	print("HIT ME")
	Global.game_controller.change_gui_scene("res://scenes/shop.tscn")
