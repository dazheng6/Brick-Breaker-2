extends Node

class_name BrickSpawner

const COLUMNS = 5
const ROWS = 6

@onready var ball = $"../Ball" as Bal
@onready var ui = $"../UI" as UI

@export var brick_scene: PackedScene
@export var margin: Vector2 = Vector2(8, 8)
@export var spawn_start: Marker2D

var brick_count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func spawn():
	var test_brick = brick_scene.instantiate() as Brick
	add_child(test_brick)
	var brick_size = test_brick.get_size() * .25
	test_brick.queue_free()
	
	var row_width = brick_size.x * COLUMNS + margin.x * (COLUMNS - 1)
	var spawn_position_x = (-row_width  + brick_size.x  + margin.x) / 2 
	var spawn_position_y = spawn_start.position.y
	
	for i in ROWS:
		for j in COLUMNS:
			var brick = brick_scene.instantiate() as Brick
			add_child(brick)
			brick.set_level(ROWS - i)
			var x = spawn_position_x + j * (margin.x + brick.get_size().x) + 250
			var y = spawn_position_y + i * (margin.y + brick.get_size().y)
			brick.set_position(Vector2(x, y))
			brick.brick_destroyed.connect(on_brick_destroyed)

func on_brick_destroyed():
	brick_count -= 1
	if brick_count == 0: 
		ball.stop_ball()
