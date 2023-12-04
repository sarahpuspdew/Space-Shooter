extends AnimatedSprite2D
class_name OneTimeAnimatedEffect


func _ready():
	animation_finished.connect(queue_free)
	animation_looped.connect(queue_free)
