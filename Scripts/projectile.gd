class_name Projectiles extends Node2D

@export var danger_level: int = 5
@export var move_direction: String
@export var missileID: int   
@export var gone := false

#var missile = preload("res://Scenes/projectile.tscn").instance()

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
	



	
		
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("innocent"):
		global.game_over = true
	if body.has_method("player"):
		print("im ded")
		global.missile.gone = true 
		remove_child(global.missile)
		add_child(global.missile)
