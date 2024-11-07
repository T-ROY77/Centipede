extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _process(delta: float) -> void:
	
	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	
		
	# Get the input direction and handle the movement/deceleration.
	var ydirection := Input.get_axis("move_up", "move_down")
	if ydirection:
		velocity.y = ydirection * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
