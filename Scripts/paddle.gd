extends RigidBody2D

class_name Paddle

var direction = Vector2.ZERO
var camera_rect Rect2
var half_paddle_width: float

@export var speed = 200
@export var camera: Camera2D

@onready var collison_shape_2d = $CollisionShape2D

func _physics_process(delta):
	linear_velocity = speed * direction

func _process(delta):
	var camera_start_x = camera.position.x - camera

func _input(event):
	if Input.is_action_pressed("left"):
		direction = Vector2.LEFT
	elif Input.is_action_pressed("right"):
		direction = Vector2.RIGHT
	else:
		direction = Vector2.ZERO

	
