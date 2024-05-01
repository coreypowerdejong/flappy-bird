extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_hud_pause():
	get_tree().paused = true


func _on_hud_start_game():
	get_tree().paused = false
	$bird.reset()
	$pipe.reset()
