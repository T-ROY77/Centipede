extends CharacterBody2D

const SPEED = 200
const DOWN = 5

@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var head: CharacterBody2D = $"."



var direction = Vector2.RIGHT

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(position)
	spawn_segment()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# position += direction * SPEED * delta
	#var col_info = move_and_collide(direction * SPEED * delta)
	#if col_info:
		#velocity = velocity.bounce(col_info.get_normal())
		#direction = -direction
		#position.y += DOWN
		
	#global_position = global_position.linear_interpolate(get_parent())
	#position = get_parent().position.y
	#set_movement_target(get_parent().global_position)
	pass
	
		
func take_damage():
	#TODO: set the children to the parent of this
	get_parent().add_child(get_child(1))
	queue_free()
	
func spawn_segment():
	#when spawned, check is more segments need to be made, then make one and add child
	if Global.current_Segments < Global.TOTAL_SEGMENTS:
		Global.current_Segments += 1
		const SEGMENT = preload("res://Scenes/segment.tscn")
		var new_segment = SEGMENT.instantiate()
		new_segment.position -= Vector2(50,0)
		add_child(new_segment)
	pass
