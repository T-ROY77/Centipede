extends Area2D

const SPEED = 500
const RANGE = 12000

var travelled_distance = 0

func _physics_process(delta: float) -> void:
	var direction = Vector2.UP.rotated(rotation)
	position += direction * SPEED * delta
	
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()
	
	


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage();
	queue_free()
