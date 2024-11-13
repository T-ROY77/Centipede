extends CharacterBody2D

const SPEED = 200
const DOWN = 5
const OFFSET = 10

@onready var head: CharacterBody2D = %Head


var direction = Vector2.RIGHT

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(position)
	spawn_segment()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#global_position = head.global_position
	#var pos = head.global_position
	pass
	
		
func take_damage():
	queue_free()
	
func spawn_segment():
	#when spawned, check is more segments need to be made, then make one and add child
	if Global.current_Segments < Global.TOTAL_SEGMENTS:
		Global.current_Segments += 1
		const SEGMENT = preload("res://Scenes/segment.tscn")
		var new_segment = SEGMENT.instantiate()
		
		#remove after follow is fixed
		new_segment.position -= Vector2(50,0)
		add_child(new_segment)
	pass
	
