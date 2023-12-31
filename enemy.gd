extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -450.0

var Player1
var Player1_chase = false

var Player2
var Player2_chase = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	if Player1_chase:
		position.x += (Player1.position.x - position.x) / SPEED

	move_and_slide()
	
	if Global.hitTimes >= 3:
		queue_free()

# Enter enemy detection range
func _on_area_2d_body_entered(body):
		Player1 = body
		Player2 = body
		Player1_chase = true
		Player2_chase = true

# Exit enemy detection range
func _on_area_2d_body_exited(body):
	Player1_chase = false
	Player2_chase = false

# Damage area
func _on_area_2d_2_body_entered(body):
	if body.name == "Player1":
		Global.health -= 1

