extends Node
class_name MoveComponent

@export var actor : Node2D
@export var velocity : Vector2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	actor.translate(velocity * delta)
