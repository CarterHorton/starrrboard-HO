class_name GameController extends Node


@export var world_2d : World2D
@export var gui : Control
var gameStart=false
var current_2d_scene
var current_gui_scene

func _ready() -> void:
	Global.game_controller = self
	current_gui_scene = $Control/MainMenu
	current_2d_scene = $World2D/game
	
func change_gui_scene(new_scene: String, delete: bool = false, keep_running: bool = true) -> void:
	if not gui:
		push_error("GUI container not assigned! Drag 'Control' node into 'Gui' export in GameController.")
		return
	
	# Remove old GUI
	if current_gui_scene != null:
		if delete:
			current_gui_scene.queue_free()
		elif keep_running:
			current_gui_scene.visible = false
		else:
			gui.remove_child(current_gui_scene)
	
	# Load and add new GUI
	var new_scene_instance = load(new_scene).instantiate()
	gui.add_child(new_scene_instance)
	current_gui_scene = new_scene_instance
	current_gui_scene.visible = true
	
	print("GUI switched to: ", new_scene)

func change_2d_scene(new_scene: String, delete: bool = false, keep_running: bool = true) -> void:
	if not world_2d:
		push_error("world_2d is null! Drag it into the export variable in GameController!")
		return
	
	# Hide old scene
	if current_2d_scene != null:
		if delete:
			current_2d_scene.queue_free()
		elif keep_running:
			current_2d_scene.visible = false
		else:
			gui.remove_child(current_2d_scene)
	
	# Load new one
	var new_instance = load(new_scene).instantiate()
	world_2d.add_child(new_instance)
	current_2d_scene = new_instance
	current_2d_scene.visible = true
	
	print("Game scene loaded: ", new_scene)
