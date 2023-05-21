extends Control

@onready var score = $Score

func set_score_label(new_score):
	score.text = "SCORE : " + str(new_score)
