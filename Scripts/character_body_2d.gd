extends CharacterBody2D


#var direction = Vector2()
var speed = 0
const MAX_SPEED = 200
var direction = Vector2()
var grid
var type
var is_moving = false
var target_pos = Vector2()
var target_direction = Vector2()

func _ready() -> void:
	grid = get_parent()
	type = grid.ENTITY.PLAYER

func _physics_process(delta: float) -> void:
	# Get the input x direction and handle the movement/deceleration.
	#direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	
	#var is_moving = Input.is_action_pressed("move_down") or Input.is_action_pressed("move_up") or Input.is_action_pressed("move_right") or Input.is_action_pressed("move_left")
	
	direction = Vector2()
	

	speed = MAX_SPEED
	if Input.is_action_pressed("move_up"):
		direction = Vector2.UP
	elif Input.is_action_pressed("move_down"):
		direction = Vector2.DOWN
	if Input.is_action_pressed("move_right"):
		direction = Vector2.RIGHT
	elif Input.is_action_pressed("move_left"):
		direction = Vector2.LEFT
	
	if not is_moving and direction != Vector2():
		target_direction = direction
		if grid._is_cell_empty(position, target_direction):
			target_pos = grid.update_child_pos(self)
			is_moving = true
	elif is_moving:
		speed = MAX_SPEED
		velocity = speed * target_direction * delta
		
		var distance_to_target = Vector2(abs(target_pos.x - position.x), abs(target_pos.y - position.y))
		
		if abs(velocity.x) > distance_to_target.x:
			velocity.x = distance_to_target.x * target_direction.x
			is_moving = false
		if abs(velocity.y) > distance_to_target.y:
			velocity.y = distance_to_target.y * target_direction.y
			is_moving = false
		move_and_collide(velocity)
	
	
	
	
	#velocity = direction * MAX_SPEED * delta
	#move_and_collide(velocity)
	
