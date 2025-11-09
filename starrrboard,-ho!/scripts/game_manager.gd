extends Node

#establish variables
@onready var label: Label = %ScoreCard			#access to the label node
var score:int = 0;										#the current score

#this adds points to score, then updates the label
func addPoint(points):
	score += points
	label.text= "Current Value: " + str(score) +"$"
