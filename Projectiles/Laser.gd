extends Node2D
class_name Laser

@onready var scale_component : ScaleComponent = $ScaleComponent as ScaleComponent
@onready var flash_component : FlashComponent = $FlashComponent as FlashComponent


func _ready():
	scale_component.tween_scale()
	flash_component.flash()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
