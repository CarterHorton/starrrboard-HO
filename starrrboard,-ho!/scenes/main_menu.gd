extends PanelContainer

const GAME = preload("res://scenes/game.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MusicManager.play_menu_music()
	get_tree().change_scene_to_file("res://main_menu.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

	


func _on_play_button_pressed() -> void:
	MusicManager.play_game_music()
	get_tree().change_scene_to_file("res://game_scene.tscn")
	get_tree().change_scene_to_packed(GAME)
	
