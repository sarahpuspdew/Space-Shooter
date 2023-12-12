extends Resource
class_name GameStats

signal score_changed(new_score)

@export var highscore : int = 0
@export var score : int = 0 :
	set(value):
		score = value
		score_changed.emit(score)
