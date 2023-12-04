extends Node2D
class_name Enemy

@onready var move_component := $MoveComponent as MoveComponent
@onready var scale_component := $ScaleComponent as ScaleComponent
@onready var shake_component := $ShakeComponent as ShakeComponent
@onready var flash_component := $FlashComponent as FlashComponent





func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
