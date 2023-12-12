extends Node2D

@onready var player := $Player
@onready var hud = $HUD

@export var game_stats : GameStats


func _ready():
	game_stats.score_changed.connect(update_score_label)
	update_score_label(game_stats.score)
	
	player.tree_exiting.connect(func():
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://Scenes/GameOver.tscn")
	)


func update_score_label(new_score : int):
	var score_label = hud.get_node("Score") as Label
	score_label.text = "Score: " + str(new_score)
