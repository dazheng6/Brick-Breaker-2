extends Node

class_name BrickSpawner

const COLUMNS = 5
const ROWS = 6

@onready var ball = $"../Ball"
@onready var ui = $"../UI"

@export var brick_scene: PackedScene
@export var margin: Vector2 = Vector2(8, 8)
@export var spawn_start: Marker2D

var brick_count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var test_brick = brick_scene.instantiate() as Brick
	add_child(test_brick)
	var brick_size = test_brick.get_size() * .25
