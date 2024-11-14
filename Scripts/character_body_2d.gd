extends CharacterBody2D


#var direction = Vector2()
var speed = 0
const MAX_SPEED = 200

	

func _physics_process(delta: float) -> void:
	# Get the input x direction and handle the movement/deceleration.
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * MAX_SPEED * delta

	#move_and_slide()
	move_and_collide(velocity)
	
