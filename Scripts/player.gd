extends CharacterBody2D


const SPEED = 150.0
@onready var gun: Area2D = $Gun


func _physics_process(delta: float) -> void:
	
	# Get the input x direction and handle the movement/deceleration.
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED

	move_and_slide()
	
	if Input.is_action_just_pressed("shoot"):
		gun.shoot()
		
		
	#if velocity.length() > 0.0:
		# is moving
		
	#else:
		#is idle
