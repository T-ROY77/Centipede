extends CharacterBody2D

const SPEED = 200
const DOWN = 5

@onready var head: CharacterBody2D = $"."



var direction = Vector2.RIGHT

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#when spawned, check is more segments need to be made, then make one and add child
	#if head.get_current_segments() < head.TOTAL_SEGMENTS:
		#head.current_segments += 1
		#const SEGMENT = preload("res://Scenes/segment.tscn")
		#var new_segment = SEGMENT.instantiate()
		#new_segment.global_position.x = global_position.x - 50
		#new_segment.global_position.y = global_position.y
	
		#new_segment.global_rotation = global_rotation
		#add_child(new_segment)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# position += direction * SPEED * delta
	var col_info = move_and_collide(direction * SPEED * delta)
	if col_info:
		#velocity = velocity.bounce(col_info.get_normal())
		direction = -direction
		position.y += DOWN
		
		
func take_damage():
	queue_free()
