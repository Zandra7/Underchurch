extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Camera2D.add_target($Player1)
	$Camera2D.add_target($Player2)
