extends Node
class_name ScoreComponent

@export var game_stats : GameStats
@export var score_amount : int


# This is the function that we call to activate this component. By default it will
# Use the score_amount when called but we could optionally pass in a different amount.
func adjust_score(amount: int = score_amount):
	game_stats.score += amount
