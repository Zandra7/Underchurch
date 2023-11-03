extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.health = 6 # Av en eller annen rar grunn mister man 3 liv i starten, så jeg la til 3 ekstra


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if Global.health == 2 and $Heart3:
		$Heart3.queue_free()
	elif Global.health == 1 and $Heart2:
		$Heart2.queue_free()
	elif Global.health == 0 and $Heart1:
		$Heart1.queue_free()
	
