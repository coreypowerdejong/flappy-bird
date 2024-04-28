extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = 400 + $top_pipe/CollisionShape2D.shape.size.x / 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.x -= 200*delta
	if global_position.x + $top_pipe/CollisionShape2D.shape.size.x / 2 < 0:
		global_position.x += 400 + $top_pipe/CollisionShape2D.shape.size.x
		global_position.y = randi_range(-0, 320)


