extends Node2D

var direction = Vector2.ZERO
var speed = 500

var isHit = false


# Called when the node enters the scene tree for the first time.
func testinit(dir,pos):
	position = pos
	direction = dir
#	$AnimatedSprite2D.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction.normalized() * speed * delta


func _on_area_2d_body_entered(body):
	if body.name != "Player1" && body.name != "Player2":
		queue_free()
		if body.name.find("ildkule"):
			isHit = true
			if isHit == true:
				Global.hitTimes += 1
				print(Global.hitTimes)
				
