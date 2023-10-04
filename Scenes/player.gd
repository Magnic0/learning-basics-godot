extends CharacterBody2D


@export var gravity = 1000
@export var speed = 400
@export var jump_strength = -650
@export var gravity_acceleration = 2.0

@export var current_level:Node2D

var jump_count = 2
var current_jumps = 0

func _physics_process(delta):
	
	move_and_slide()
	handle_movement()
	apply_gravity(delta)
	allow_jump()

func handle_movement():
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
		$gfx.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

func apply_gravity(delta):
	if not is_on_floor():
		velocity.y += gravity * gravity_acceleration * delta

func allow_jump():
	if is_on_floor(): current_jumps = 0
	
	if Input.is_action_just_pressed("jump"):
		if is_on_floor() or current_jumps < jump_count:
			velocity.y = jump_strength
			current_jumps += 1

func _on_area_2d_body_entered(body):
	if body.is_in_group("collectible"):
		current_level.update_ui_score(body.value)
		body.collect()
	
