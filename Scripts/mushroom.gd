extends StaticBody2D

var HP = 3

func take_damage():
	
	if HP > 0:
		HP -= 1
	else:
		queue_free()
		
