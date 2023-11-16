extends Area2D

var player1InArea = false
var player2InArea = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	



func _on_body_entered(body):
	print(body.name)
	if body.name == "Player1":
		player1InArea = true
		print("p1 in area ", player1InArea)
	elif body.name == "Player2":
		player2InArea = true
		print("p2 in area ", player2InArea)

	if player1InArea and player2InArea:
		pass # Noe som skal skje når man vinner
