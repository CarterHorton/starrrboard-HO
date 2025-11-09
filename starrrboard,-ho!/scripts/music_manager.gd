extends Node

@onready var player: AudioStreamPlayer = $Player
const START_PAGE_MUSIC = preload("res://assets/audio/Start_Page_Music.mp3")
const GAMEPLAY_MUSIC = preload("res://assets/audio/Gameplay_Music.mp3")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_menu_music()  # Starts menu music automatically

func play_menu_music():
	player.stream = START_PAGE_MUSIC
	player.play()

func play_game_music():
	player.stream = GAMEPLAY_MUSIC
	player.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:	pass
