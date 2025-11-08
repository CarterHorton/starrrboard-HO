extends Node

@onready var label: Label = $"../player/Label"
var score:int = 0;

func addPoint():
	score += 1
	label.text= "Current Value: " + str(score) +"$"
