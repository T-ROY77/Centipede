extends CharacterBody2D

const SPEED = 100
const DOWN = .05
const OFFSET = 25

var is_head = true
var direction = Vector2.RIGHT


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#if is_head:
		#rotation += deg_to_rad(90)
	spawn_segment()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_head:
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
	#when spawned, check is more segments need to be made, then make one and add child
	if Global.current_Segments < Global.TOTAL_SEGMENTS:
		Global.current_Segments += 1
		const SEGMENT = preload("res://Scenes/segment.tscn")
		var new_segment = SEGMENT.instantiate()
		new_segment.is_head = false
		new_segment.rotation = rotation
		new_segment.position -= Vector2(OFFSET,0)
		add_child(new_segment)
	pass
	
