extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -450.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var speed = 200
var anim
var fireballTscn = preload("res://ildkule.tscn")
var fireballInstance
var previousDirection = Vector2(1,0)
var timer
var fireballReady = true
var direction = Vector2.ZERO

func _ready():
	anim = $AnimatedSprite2D
	timer = $Timer

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("p2jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Vector2.ZERO
	direction = Vector2(Input.get_axis("p2left", "p2right"), 0)
	if direction:
		velocity.x = direction.x * SPEED
		if Input.is_action_just_pressed("p2left"):
			anim.flip_h = true
			anim.play("walk")
		elif Input.is_action_just_pressed("p2right"):
			anim.flip_h = false
			anim.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	#var direction = Vector2.ZERO	
	if direction:
		previousDirection = direction
	
	#Shoot fireball in facing direction
	if Input.is_action_just_pressed("p2shoot") && fireballReady:
		fireballInstance = fireballTscn.instantiate()
		fireballInstance.testinit(previousDirection,position)
		get_parent().add_child(fireballInstance)
		#$AudioStreamPlayer2D.play()
		fireballReady = false
		timer.start()

	move_and_slide()


func _on_timer_timeout():
	fireballReady = true 

