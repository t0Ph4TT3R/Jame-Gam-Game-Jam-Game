extends CharacterBody2D


const normal_speed = 600.0
var speed = normal_speed 
const JUMP_VELOCITY = -1000.0

var air_dash = false

var facing_right = true
@onready var player2: CharacterBody2D = %Player


func player():
	pass

func _process(delta: float) -> void:
		 
	if $DashTimer.is_stopped():
		$DashTimer.wait_time = 0.2
	if Input.is_action_pressed("move_left"):
		facing_right = false
		$Bodyguard.flip_h = true
	elif Input.is_action_pressed("move_right"):
		facing_right = true
		$Bodyguard.flip_h = false
		
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
		
		if facing_right == false:
			$AnimationPlayer.play("dive_left")
		elif facing_right == true:
			$AnimationPlayer.play("dive")
		
		if not is_on_floor():
			air_dash = true
	elif Input.is_action_just_pressed("dash") and air_dash == false:
		speed = normal_speed * 5
		$DashTimer.start()
		if not is_on_floor():
			air_dash = true
	if is_on_floor():
		air_dash = false
		
	var player_x = player2.global_position.x
	var player_y = player2.global_position.y
	if player_x < -3000 or player_x > 3500:
		global.game_over = true
	elif player_y > 1000 or player_y < -1917:
		global.game_over = true
		
	move_and_slide()



func _on_dash_timer_timeout() -> void:
	speed = normal_speed
