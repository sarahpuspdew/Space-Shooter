extends Node2D
class_name Laser

@onready var scale_component := $ScaleComponent as ScaleComponent
@onready var flash_component := $FlashComponent as FlashComponent
@onready var hitbox_component := $HitboxComponent as HitboxComponent


func _ready():
	scale_component.tween_scale()
	flash_component.flash()
	hitbox_component.hit_hurtbox.connect(_on_hit_hurtbox)


func _on_hit_hurtbox(hurtbox):
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
