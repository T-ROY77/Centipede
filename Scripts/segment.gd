extends CharacterBody2D

const SPEED = 400
const DOWN = 5

var direction = Vector2.RIGHT
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# position += direction * SPEED * delta
	var col_info = move_and_collide(direction * SPEED * delta)
	if col_info:
		#velocity = velocity.bounce(col_info.get_normal())
		direction = -direction
		position.y += DOWN
