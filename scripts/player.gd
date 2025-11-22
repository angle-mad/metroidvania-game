extends CharacterBody2D

var input
@export var speed = 500.0
@export var gravity = 10

var jump_count = 0
@export var max_jump = 2
@export var jump_force = 500

func _ready():
	pass

func _process(delta):
	movement(delta)
	
func movement(delta):
	input = Input.get_action_strength("d_key") - Input.get_action_strength("a_key") 
	
	if input != 0:
		if input > 0:
			velocity.x += speed * delta
			velocity.x = clamp(speed, 100.0, speed)
		if input < 0: 
			velocity.x -= speed * delta
			velocity.x = clamp(-speed, 100.0, -speed)
	if input == 0:
		velocity.x = 0
	
	if is_on_floor():
		jump_count = 0
	
	if Input.is_action_pressed("ui_accept") && is_on_floor() && jump_count < max_jump:
		jump_count += 1
		velocity.y -= jump_force
		velocity.x = input
		
	if !is_on_floor() && Input.is_action_just_pressed("ui_accept") && jump_count < max_jump:
		jump_count += 1
		velocity.y -= jump_force
		velocity.x = input
		
	if !is_on_floor() && Input.is_action_just_released("ui_accept") && jump_count < max_jump:
		velocity.y = gravity
		velocity.x = input
	
	velocity.y += gravity
	move_and_slide()
