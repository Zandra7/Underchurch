extends CharacterBody2D

const SPEED = 300.0
const AIR_SPEED = 700
const JUMP_VELOCITY = -500.0

const WALL_JUMP_DISTANCE = -250
const WALL_JUMP_HEIGHT = -600

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var anim

var Direction = "Right"
var jumpDelay = false
var whichWall = ""

func _ready():
	anim = $AnimatedSprite2D

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	# Collide with right wall
	if $RayCastRight.is_colliding():
		if $RayCastRight.get_collider().name.find("wall"):
			whichWall = "right"
			
	# Collide with left wall
	elif $RayCastLeft.is_colliding():
		if $RayCastLeft.get_collider().name.find("wall"):
			whichWall = "left"

	if Input.is_action_just_pressed("p1jump"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		elif is_on_wall() and whichWall == "right":
			velocity.y = WALL_JUMP_HEIGHT
			velocity.x = WALL_JUMP_DISTANCE
			jumpDelay = true
		elif is_on_wall() and whichWall == "left":
			velocity.y = WALL_JUMP_HEIGHT
			velocity.x = WALL_JUMP_DISTANCE * -1
			jumpDelay = true

	if is_on_floor():
		jumpDelay = false

	var direction = Input.get_axis("p1left", "p1right")
	if jumpDelay == false:
		if direction:
			velocity.x = direction * SPEED
		elif is_on_floor():
			velocity.x = move_toward(velocity.x, 0, SPEED)
		else:
			velocity.x = move_toward(velocity.x, 0, AIR_SPEED)

	move_and_slide()

	# Call a function to update animations
	update_animations(direction)

func update_animations(direction):
	if is_on_floor():
		if direction != 0:
			anim.play("walk")
			anim.flip_h = direction >= 0
		else:
			anim.play("idle")
	else:
		anim.play("jump")
		anim.flip_h = direction >= 0
