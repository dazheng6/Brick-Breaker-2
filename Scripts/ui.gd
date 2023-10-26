extends CanvasLayer

class_name UI

@onready var lifes_label = $MarginContainer/HBoxContainer/LifesLabel

@onready var game_lost_container = $GameLostContainer
	
func _ready():
	game_lost_container.hide()
	
func set_lifes(lifes: int):
	lifes_label.text = "lifes: %d" % lifes

func game_over():
	game_lost_container.show()

func _on_game_lost_button_pressed():
	get_tree().reload_current_scene()
