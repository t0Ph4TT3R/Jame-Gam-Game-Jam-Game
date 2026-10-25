extends Node

var game_over = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if game_over:
		get_tree().change_scene_to_file("res://Scenes/game.tscn")
	if Input.is_action_just_pressed("select") and get_tree().get_current_scene().name == "game":
		pass
