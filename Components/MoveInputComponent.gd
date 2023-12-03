extends Node
class_name MoveInputComponent

@export var move_component : MoveComponent
@export var move_stats : MoveStats


func _input(event):
	var dir = Input.get_axis("left", "right")
	move_component.velocity = Vector2(dir * move_stats.speed, 0)
