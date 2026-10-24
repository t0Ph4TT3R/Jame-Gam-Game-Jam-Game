extends CharacterBody2D


const normal_speed = 450.0
var speed = normal_speed 
const JUMP_VELOCITY = -800.0

var air_dash = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * speed
		#$AnimatedSprite2d = 
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	#dash
	if Input.is_action_just_pressed("dash") and air_dash == false:
		$DashTimer.start()
		speed = normal_speed * 3
		if not is_on_floor():
			air_dash = true
	if is_on_floor():
		air_dash = false
		
	move_and_slide()


func _on_dash_timer_timeout() -> void:
	speed = normal_speed
