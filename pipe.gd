extends Node2D

var window_size
var passed_pipe
signal score_point

func reset():
		window_size = get_viewport().get_visible_rect().size
		position.x = window_size.x + $top_pipe/Head.shape.size.x / 2
		passed_pipe = false

# Called when the node enters the scene tree for the first time.
func _ready():
	reset()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.x -= 200*delta
	if global_position.x + $top_pipe/Head.shape.size.x / 2 < 0:
		global_position.x += window_size.x + $top_pipe/Head.shape.size.x
		global_position.y = randi_range(0, window_size.y - 400)
		passed_pipe = false
	
	# Calculate score increase
	if !passed_pipe and global_position.x < window_size.x / 2:
		passed_pipe = true
		score_point.emit()


