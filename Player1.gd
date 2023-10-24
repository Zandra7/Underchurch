extends CharacterBody2D

 

const SPEED = 300.0
const JUMP_VELOCITY = -500.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var Direction = "Right"
var jumpDelay = false


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
 

	if Input.is_action_just_pressed("p1jump"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		elif is_on_wall():
			velocity.y = JUMP_VELOCITY - 100
			velocity.x = JUMP_VELOCITY - 250
			$Timer.start()
			jumpDelay = true
			await $Timer.timeout
			print("es")
			jumpDelay = false
	
	
	var direction = Input.get_axis("p1left", "p1right")
	if	jumpDelay == false:
		if direction:
			velocity.x = direction * SPEED
		elif is_on_floor():
			velocity.x = move_toward(velocity.x, 0, SPEED)
		else:
			velocity.x = move_toward(velocity.x, 0, 50)

 

	move_and_slide()
