extends CharacterBody2D

var input
@export var speed = 100.0
@export var gravity = 10

func _ready():
	pass

func _process(delta):
	movement(delta)
	
func movement(delta):
	input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left") 
	
	if input != 0:
		if input > 0:
			velocity.x += speed * delta
		if input < 0: 
			velocity.x -= speed * delta
			
	if input == 0:
		velocity.x = 0
		
	move_and_slide()
