extends Node2D

var direction = Vector2.ZERO
var speed = 500

# Called when the node enters the scene tree for the first time.
func testinit(dir,pos):
	position = pos
	direction = dir
#	$AnimatedSprite2D.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction.normalized() * speed * delta


func _on_area_2d_body_entered(body):
	print(body.name)
	if body.name != "TopDownGuy":
		queue_free()
