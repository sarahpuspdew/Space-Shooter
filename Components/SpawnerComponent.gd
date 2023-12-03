extends Node
class_name SpawnerComponent

@export var scene : PackedScene


func spawn(position):
	assert(scene is PackedScene, "Error: The scene export was never set on this spawner component.")
	
	var instance = scene.instantiate()
	var parent = get_tree().current_scene
	
	parent.add_child(instance)
	instance.global_position = position
	
	return instance
