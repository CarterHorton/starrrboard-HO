extends Node

@onready var label: Label = $"../player/Label"
var score:int = 0;

func addPoint(points):
	score += points
	label.text= "Current Value: " + str(score) +"$"
