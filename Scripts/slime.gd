extends Node2D

const slime_speed = 30;
var direction = 1;

@onready var ray_cast_right = $RayCast_Right
@onready var ray_cast_left = $RayCast_Left
@onready var animated_sprite = $AnimatedSprite2D

func _process(delta):
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	
	position.x += direction * slime_speed * delta
