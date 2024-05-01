extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var jump_texture
var glide_texture

var angle

func reset():
	var window_size: Vector2 = get_viewport().get_visible_rect().size
	position = window_size / 2
	velocity = Vector2.ZERO
	global_rotation_degrees = 90

func _ready():
	jump_texture = load("res://art/playerGrey_up2.png")
	glide_texture = load("res://art/playerGrey_up1.png")
	reset()
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY
		$Sprite2D.texture = jump_texture
		$FlapTimer.start()
	
	# Set angle of flight
	angle = atan2(velocity.y, 400)
	global_rotation = angle + PI / 2
	move_and_slide()


func _on_flap_timer_timeout():
	$Sprite2D.texture = glide_texture
