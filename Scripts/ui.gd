extends CanvasLayer

class_name UI

@onready var lifes_label = $MarginContainer/HBoxContainer/LifesLabel

@onready var game_lost_container = $GameLostContainer
	
func _ready():
	game_lost_container.hide()
	$GameBGM.play()
	
func set_lifes(lifes: int):
	lifes_label.text = "lifes: %d" % lifes

func game_over():
	$GameOverSong.play()
	game_lost_container.show()
	$GameBGM.stop()
	
func on_level_won():
	$LevelWonContainer.show()
	$LevelPassed.play()
	$GameBGM.stop()

func _on_level_won_button_pressed():
	LevelDefinitions.current_level = 2
	get_tree().reload_current_scene()
