extends CharacterBody2D

 

const SPEED = 300.0
const AIR_SPEED = 2
const JUMP_VELOCITY = -500.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var Direction = "Right"
var jumpDelay = false
var whichWall = ""


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	# Collide with right wall
	if $RayCastRight.is_colliding():		
#		print($RayCastRight.get_collider().name)	
		if $RayCastRight.get_collider().name.find("wall"):
			whichWall = "right"
			
	# Collide with left wall
	elif $RayCastLeft.is_colliding():		
#		print($RayCastLeft.get_collider().name)	
		if $RayCastLeft.get_collider().name.find("wall"):
			whichWall = "left"

	if Input.is_action_just_pressed("p1jump"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		elif is_on_wall() and whichWall == "right":
			velocity.y = JUMP_VELOCITY - 200
			velocity.x = JUMP_VELOCITY - AIR_SPEED
			jumpDelay = true
		elif is_on_wall() and whichWall == "left":
			velocity.y = JUMP_VELOCITY - 200
			velocity.x = JUMP_VELOCITY *-1 + AIR_SPEED
			jumpDelay = true

	if is_on_floor():
			jumpDelay = false
	
	var direction = Input.get_axis("p1left", "p1right")
	if	jumpDelay == false:
		if direction:
			velocity.x = direction * SPEED
		elif is_on_floor():
			velocity.x = move_toward(velocity.x, 0, SPEED)
		else:
			velocity.x = move_toward(velocity.x, 0, AIR_SPEED)


	move_and_slide()


