extends Node

var game_over = false
var score = 0
var missile = preload("res://Scenes/projectile.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if game_over:
		print("game_over")
		get_tree().change_scene_to_file("res://Scenes/game.tscn")
		score = 0
		game_over = false
	if Input.is_action_just_pressed("select") and get_tree().get_current_scene().name == "game":
		pass
	if score >= 12:
		get_tree().change_scene_to_file("res://Scenes/win.tscn")
