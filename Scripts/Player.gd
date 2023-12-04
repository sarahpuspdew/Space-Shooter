extends Node2D
class_name Player

@onready var left_muzzle := $LeftMuzzle
@onready var right_muzzle := $RightMuzzle
@onready var ship_sprite := $Anchor/AnimatedSprite2D
@onready var flame_sprite := $Anchor/FlameAnimatedSprite
@onready var lase_spawner_component := $LaserSpawnerComponent as SpawnerComponent
@onready var scale_component := $ScaleComponent as ScaleComponent
@onready var stats_component := $StatsComponent as StatsComponent
@onready var hurtbox_component := $HurtboxComponent as HurtboxComponent
@onready var explosion_spawner_component := $ExplosionSpawnerComponent as SpawnerComponent


func _ready():
	stats_component.no_health.connect(_on_stats_no_health)


func _process(delta):
	animate_ship()


func _on_stats_no_health():
	queue_free()


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
		lase_spawner_component.spawn(left_muzzle.global_position)
		lase_spawner_component.spawn(right_muzzle.global_position)
		
		scale_component.tween_scale()


func _on_fire_rate_timer_timeout():
	shoot()
