extends Node
@onready var puntos: Label = %Puntos

var current_score: int = 0
var points = 0

func add_point():
	points += 1
	puntos.text = "Puntos: " + str(points)
	
func remove_point():
	points -= 3
	puntos.text = "Puntos: " + str(points)
