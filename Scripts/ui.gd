extends CanvasLayer

class_name UI

@onready var lifes_label = $MarginContainer/HBoxContainer/LifesLabel
@onready var levels_label = $LevelContainer/HBoxContainer/LevelsLabel
@onready var game_lost_container = $GameLostContainer
@onready var level_count = $LevelContainer/HBoxContainer/LevelInt
func _ready():
	$GameLostContainer.hide()
	$GameBGM.play()
	level_count = LevelDefinitions.current_level
func set_level (level: int):
	levels_label.text = "Level: %d" % level_count
	
func set_lifes(lifes: int):
	lifes_label.text = "lifes: %d" % lifes

func game_over():
	$GameOver.play()
	#Dark Souls You Died SFX
	$GameOVer2.play()
	$GameLostContainer.show()
	$GameBGM.stop()
	LevelDefinitions.current_level = 1
func on_level_won():
	$LevelWonContainer.show()
	$LevelPassed.play()
	$GameBGM.stop()
	LevelDefinitions.current_level += 1
	level_count = LevelDefinitions.current_level
func _on_level_won_button_pressed():
	get_tree().reload_current_scene()

func _on_game_lost_button_pressed():
	LevelDefinitions.current_level = 1
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
