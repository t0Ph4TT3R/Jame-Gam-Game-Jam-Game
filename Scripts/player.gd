extends CharacterBody2D


const normal_speed = 600.0
var speed = normal_speed 
const JUMP_VELOCITY = -900.0

var air_dash = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta * 1.5

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
	if air_dash == false and Input.is_action_just_pressed("down"):
		speed = normal_speed * 7
		#$DashTimer.wait_time = .15
		$DashTimer.start()
		$AnimatedSprite2D.play("dive")
		if not is_on_floor():
			air_dash = true
	elif Input.is_action_just_pressed("dash") and air_dash == false:
		speed = normal_speed * 5
		$DashTimer.start()
		if not is_on_floor():
			air_dash = true
	if is_on_floor():
		air_dash = false
		
	move_and_slide()

func _process(delta: float) -> void:
	if $DashTimer.is_stopped():
		$DashTimer.wait_time = 0.2

func _on_dash_timer_timeout() -> void:
	speed = normal_speed
