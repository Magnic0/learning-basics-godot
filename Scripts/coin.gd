extends Area2D

@onready var animation_player = $AnimationPlayer
@onready var game_manager = %"Game Manager"

func _on_body_entered(_body):
	game_manager.add_point()
	animation_player.play("pickup-coin")
