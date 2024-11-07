extends CharacterBody2D

const SPEED = 200
const DOWN = 5
const TOTAL_SEGMENTS = 7

var current_segments = 0;
var direction = Vector2.RIGHT

func _ready() -> void:
	if current_segments < TOTAL_SEGMENTS:
		current_segments += 1
		const SEGMENT = preload("res://Scenes/segment.tscn")
		var new_segment = SEGMENT.instantiate()
		new_segment.global_position.x = global_position.x - 50
		new_segment.global_position.y = global_position.y
	
		#new_segment.global_rotation = global_rotation
		add_child(new_segment)
		
		
func _process(delta: float) -> void:
	
	var col_info = move_and_collide(direction * SPEED * delta)
	if col_info:
		#velocity = velocity.bounce(col_info.get_normal())
		direction = -direction
		position.y += DOWN
		
func get_current_segments() -> void:
	current_segments
