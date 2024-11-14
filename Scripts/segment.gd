extends CharacterBody2D


const SPEED = 100

const DOWN = .05
const OFFSET = 25

var is_head = false
var direction = Vector2.RIGHT
var target_direction = Vector2()
var target_pos = Vector2()
var last_dir = Vector2()
var turn = false
#@onready var grid: TileMapLayer = $Grid
var grid
var type


func _ready() -> void:

	#TODO: get grid
	grid = get_parent()
	#grid = get_node("Grid")
	#type = grid.ENTITY.SEGMENT
	
	

	#if is_head:
		#rotation += deg_to_rad(90)

	spawn_segment()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#if is_head:
		#var col_info = move_and_collide(direction * SPEED * delta)
		##hit a wall or mush
		#if col_info:
			##if moving right
			#if direction == Vector2.RIGHT:
				#rotation += deg_to_rad(90)
				#direction = Vector2.DOWN
				#await get_tree().create_timer(DOWN).timeout
				#rotation += deg_to_rad(90)
				#direction = Vector2.LEFT
			##if moving left
			#elif direction == Vector2.LEFT:
				#rotation -= deg_to_rad(90)
				#direction = Vector2.DOWN
				#await get_tree().create_timer(DOWN).timeout
				#rotation -= deg_to_rad(90)
				#direction = Vector2.RIGHT
	
	
func _physics_process(delta: float) -> void:
	target_direction = direction
	
	if grid._is_cell_empty(position, target_direction):
		target_pos = grid.update_child_pos(self)
		if turn:
			direction = -last_dir
		else:
			direction = Vector2.RIGHT
	else:
		last_dir = direction
		direction = Vector2.DOWN
		turn = true
		
		
	var distance_to_target = Vector2(abs(target_pos.x - position.x), abs(target_pos.y - position.y))
	
	if abs(velocity.x) > distance_to_target.x:
		velocity.x = distance_to_target.x * target_direction.x
	if abs(velocity.y) > distance_to_target.y:
		velocity.y = distance_to_target.y * target_direction.y
	
	move_and_collide(velocity)
	
	
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
	
