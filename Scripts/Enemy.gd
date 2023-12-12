extends Node2D
class_name Enemy

@onready var move_component := $MoveComponent as MoveComponent
@onready var scale_component := $ScaleComponent as ScaleComponent
@onready var shake_component := $ShakeComponent as ShakeComponent
@onready var flash_component := $FlashComponent as FlashComponent
@onready var hitbox_component := $HitboxComponent as HitboxComponent
@onready var hurtbox_component := $HurtboxComponent as HurtboxComponent
@onready var stats_component := $StatsComponent as StatsComponent
@onready var destroyed_component := $DestroyedComponent as DestroyedComponent
@onready var score_component := $ScoreComponent as ScoreComponent


func _ready():
	hurtbox_component.hurt.connect(_on_hurtbox_hurt)
	hitbox_component.hit_hurtbox.connect(_on_hitbox_hit)
	stats_component.no_health.connect(_on_stats_no_health)


func _on_hitbox_hit(hurtbox):
		destroyed_component.destroy()


func _on_hurtbox_hurt(hitbox):
	flash_component.flash()
	scale_component.tween_scale()
	shake_component.tween_shake()


func _on_stats_no_health():
	score_component.adjust_score()
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
