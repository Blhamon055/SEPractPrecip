extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 0

"""
func _physics_process(delta):
	velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	get_input()
	move_and_slide()
func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * SPEED
"""

func _physics_process(delta):
	var velocityOG = velocity
	# Add the gravity.
	velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
			if Input.is_action_just_pressed("ui_up"):
				$AnimatedSprite2D.play("Jump")
			if Input.is_action_just_released("ui_up"):
				$AnimatedSprite2D.stop()
	

	if !Input.is_anything_pressed():
		$AnimatedSprite2D.play("Idle")

	# Get the input direction.
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * SPEED
	if Input.is_action_just_pressed("ui_left"):
		$AnimatedSprite2D.play("WalkF")
		$AnimatedSprite2D.flip_h = true;
	if Input.is_action_just_pressed("ui_right"):
		$AnimatedSprite2D.play("WalkF")
		$AnimatedSprite2D.flip_h = false;
	if Input.is_action_just_released("ui_right"):
		$AnimatedSprite2D.stop()
	if Input.is_action_just_released("ui_left"):
		$AnimatedSprite2D.stop()
	move_and_slide()
