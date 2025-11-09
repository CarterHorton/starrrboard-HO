extends PanelContainer

@onready var game_controller: GameController = get_node("/root").get_child(0) as GameController
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MusicManager.play_menu_music()
	await get_tree().process_frame
	Global.game_controller.change_gui_scene("res://scenes/main_menu.tscn")
	
func _on_play_button_pressed() -> void:
	if Global.game_controller.gameStart == false:
		MusicManager.play_game_music()
		Global.game_controller.change_2d_scene("res://scenes/game.tscn")
		Global.game_controller.gameStart=true
		queue_free()
