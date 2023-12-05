extends Node2D
class_name EnemyGenerator

const GREEN_ENEMY_SCENE = preload("res://Scenes/GreenEnemy.tscn")
const PINK_ENEMY_SCENE = preload("res://Scenes/PinkEnemy.tscn")
const YELLOW_ENEMY_SCENE = preload("res://Scenes/YellowEnemy.tscn")

@onready var spawner_component := $SpawnerComponent as SpawnerComponent
@onready var green_enemy_spawn_timer := $GreenEnemySpawnTimer
@onready var pink_enemy_spawn_timer = $PinkEnemySpawnTimer
@onready var yellow_enemy_spawn_timer = $YellowEnemySpawnTimer

var margin = 8
var screen_width = ProjectSettings.get_setting("display/window/size/viewport_width")


func handle_spawn(enemy_scene : PackedScene, timer : Timer):
	spawner_component.scene = enemy_scene
	spawner_component.spawn(Vector2(randf_range(margin, screen_width-margin), -16))
	timer.start()


func _on_green_enemy_spawn_timer_timeout():
	handle_spawn(GREEN_ENEMY_SCENE, green_enemy_spawn_timer)


func _on_pink_enemy_spawn_timer_timeout():
	handle_spawn(PINK_ENEMY_SCENE, pink_enemy_spawn_timer)


func _on_yellow_enemy_spawn_timer_timeout():
	handle_spawn(YELLOW_ENEMY_SCENE, yellow_enemy_spawn_timer)
