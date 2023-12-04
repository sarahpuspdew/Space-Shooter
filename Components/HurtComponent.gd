extends Node
class_name HurtComponent

@export var stats_component : StatsComponent
@export var hurtbox_component : HurtboxComponent

func _ready():
	hurtbox_component.hurt.connect(_on_hurt_hurtbox)


func _on_hurt_hurtbox(hitbox : HitboxComponent):
	stats_component.health -= hitbox.damage
