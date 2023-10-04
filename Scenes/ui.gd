extends CanvasLayer
class_name ui

@onready var score_label = %Label
@onready var completed_ui = $Control/GameCompleteUI

var score = 0
var maxScore = 30

func update_score(value):
	score += value
	update_score_label()
	
	if (score >= maxScore):
		completed_ui.visible = true
		score_label.visible = false

func update_score_label():
	print(score)
	score_label.text = "Score: " + str(score)

func _on_button_pressed():
	get_tree().reload_current_scene()
