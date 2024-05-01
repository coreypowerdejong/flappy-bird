extends CanvasLayer

signal start_game
signal pause

var score
# Called when the node enters the scene tree for the first time.
func _ready():
	score = 0
	$ScoreLabel.text = str(score)
	$GameOverLabel.hide()
	pause.emit()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pipe_score_point():
	score += 1
	$ScoreLabel.text = str(score)


func _on_start_button_pressed():
	$StartButton.hide()
	$GameOverLabel.hide()
	$ScoreLabel.show()
	start_game.emit()


func _on_pipe_body_entered(body):
	$StartButton.show()
	$StartButton.text = "Play Again"
	$GameOverLabel.text = "Game over!\nScore: " + str(score)
	$ScoreLabel.hide()
	$GameOverLabel.show()
	pause.emit()
