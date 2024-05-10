extends CanvasLayer

signal start_game
signal pause

var score
var high_score
# Called when the node enters the scene tree for the first time.
func _ready():
	score = 0
	$ScoreLabel.text = str(score)
	$GameOverLabel.hide()
	pause.emit()


func _on_pipe_score_point():
	score += 1
	$ScoreLabel.text = str(score)
	$ScoreSound.play()


func _on_start_button_pressed():
	$StartButton.hide()
	$GameOverLabel.hide()
	score = 0
	$ScoreLabel.text = str(score)
	$ScoreLabel.show()
	start_game.emit()


func _on_pipe_body_entered(_body):
	high_score = int(load_score())
	high_score = max(score, high_score)
	save_score(high_score)
	$LoseSound.play()
	$StartButton.show()
	$StartButton.text = "Play Again"
	$GameOverLabel.text = "Game over!\nScore: " + str(score) + "\nHigh Score: " + str(high_score)
	$ScoreLabel.hide()
	$GameOverLabel.show()
	pause.emit()

func save_score(content):
	var file = FileAccess.open("user://save_game.dat", FileAccess.WRITE)
	file.store_string(str(content))

func load_score():
	var file = FileAccess.open("user://save_game.dat", FileAccess.READ)
	if file == null:
		return 0
	var content = file.get_as_text()
	return content
