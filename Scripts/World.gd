extends Node2D

@onready var player := $Player


func _ready():
	player.tree_exiting.connect(func():
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://Scenes/GameOver.tscn")
	)
