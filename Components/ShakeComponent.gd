extends Node
class_name ShakeComponent

@export var sprite : Node2D
@export var shake_amount : float = 2.0
@export var shake_duration : float = 0.4

var shake = 0


func _physics_process(delta):
	sprite.position = Vector2(randf_range(-shake, shake), randf_range(-shake, shake))


func tween_shake():
	shake = shake_amount
	
	var tween = create_tween()
	tween.tween_property(self, "shake", 0.0, shake_duration).from_current()
