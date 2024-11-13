extends CharacterBody2D

const SPEED = 200
const DOWN = .05




var direction = Vector2.RIGHT

func _ready() -> void:
	rotation += deg_to_rad(90)
	spawn_segment()
		
		
func _process(delta: float) -> void:

	
	
	var col_info = move_and_collide(direction * SPEED * delta)
	#hit a wall or mush
	if col_info:
		#if moving right
		if direction == Vector2.RIGHT:
			rotation += deg_to_rad(90)
			direction = Vector2.DOWN
			await get_tree().create_timer(DOWN).timeout
			rotation += deg_to_rad(90)
			direction = Vector2.LEFT
		#if moving left
		elif direction == Vector2.LEFT:
			rotation -= deg_to_rad(90)
			direction = Vector2.DOWN
			await get_tree().create_timer(DOWN).timeout
			rotation -= deg_to_rad(90)
			direction = Vector2.RIGHT
		
func take_damage():
	queue_free()
	
func spawn_segment():
	if Global.current_Segments < Global.TOTAL_SEGMENTS:
		Global.current_Segments += 1
		const SEGMENT = preload("res://Scenes/segment.tscn")
		var new_segment = SEGMENT.instantiate()
		
		#remove after follow is fixed
		new_segment.position -= Vector2(50,0)
		add_child(new_segment)
		
