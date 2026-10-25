extends CharacterBody2D


const normal_speed = 600.0
var speed = normal_speed 
const JUMP_VELOCITY = -2000.0
var facing_right = true
var nodes = $".".get_children()
var highest = 0
var node_h = null
var position_d_x = null
var position_d_y = null

func _process(delta: float) -> void:
	facing_right = true
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta * 1.5
	for node in nodes:
		if "danger_level" in node:
			if node.danger_level > highest:
				highest = node.danger_level
				node_h = node
				var position_d_y = node.global_position.y
				var position_d_x = node.global_position.x
	if node_h != null :
		pass
	else:
		return 

	if $Innocent.global_position[1] < position_d_y:
		velocity.y = JUMP_VELOCITY
	# for x in dangerous_away_from_player; find largest number; while !gameover; if y_val_targest > y_val_innocent; jump(); move_right();

	# Handle jump.
	#if Input.is_action_just_pressed("jump") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("move_left", "move_right")
	#if direction:
	#	velocity.x = direction * speed
		#$AnimatedSprite2d = 
	#else:
	#	velocity.x = move_toward(velocity.x, 0, speed)
	
	move_and_slide()
