extends TextureProgressBar

var timer

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.timerValue = value
	value = 60
	timer = $Timer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if value > 60:
		value = 60

func _on_timer_timeout():
	Global.timerValue -= 1
	value = Global.timerValue
	print(value)
	
