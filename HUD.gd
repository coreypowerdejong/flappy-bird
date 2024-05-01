extends CanvasLayer

signal start_game

var score
# Called when the node enters the scene tree for the first time.
func _ready():
	score = 0
	$ScoreLabel.text = str(score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pipe_score_point():
	score += 1
	$ScoreLabel.text = str(score)


func _on_start_button_pressed():
	$StartButton.hide()
	start_game.emit()


func _on_pipe_body_entered(body):
	print("Hit!")
