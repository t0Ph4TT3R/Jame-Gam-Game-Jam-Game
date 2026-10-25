class_name Projectile extends AnimatableBody2D

@export var danger_level: int = 5
@export var move_direction: String 
var speed = 400
var firstime = true
#@export var something := ""
func _ready() -> void:
	#$Area2D/CollisionShape2D.global_position = $AnimatableBody2D/CollisionShape2D.global_position
	pass
func _physics_process(delta: float) -> void:
	if move_direction == "right":
		position.x += delta * speed
	elif move_direction == "left":
		position.x -= delta * speed
	elif move_direction == "down":
		position.y += delta * speed
	else: 
		position.y -= delta * speed
	
