extends Node

var game_over = false

var missile = preload("res://Scenes/projectile.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if game_over:
		get_tree().change_scene_to_file("res://Scenes/game.tscn")
		print("gam over")
	#for missile.missileID in missiles:
		
	if Input.is_action_just_pressed("select") and get_tree().get_current_scene().name == "game":
		pass 
