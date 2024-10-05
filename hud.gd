extends Control

#score value
@onready var score = $Score:
	set(value):
		score.text = "SCORE: " + str(value)
		
