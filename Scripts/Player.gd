extends Node2D
class_name Player

@onready var left_muzzle : Marker2D = $LeftMuzzle
@onready var right_muzzle : Marker2D = $RightMuzzle
@onready var spawner_component : SpawnerComponent = $SpawnerComponent as SpawnerComponent
@onready var scale_component : ScaleComponent = $ScaleComponent as ScaleComponent
@onready var ship_sprite : AnimatedSprite2D = $Anchor/AnimatedSprite2D
@onready var flame_sprite : AnimatedSprite2D = $Anchor/FlameAnimatedSprite


func _process(delta):
	animate_ship()


func animate_ship():
	if Input.is_action_pressed("left"):
		ship_sprite.play("turn_left")
		flame_sprite.play("turn_left")
	elif Input.is_action_pressed("right"):
		ship_sprite.play("turn_right")
		flame_sprite.play("turn_right")
	else:
		ship_sprite.play("center")
		flame_sprite.play("center")


func shoot():
		spawner_component.spawn(left_muzzle.global_position)
		spawner_component.spawn(right_muzzle.global_position)
		
		scale_component.tween_scale()


func _on_fire_rate_timer_timeout():
	shoot()
