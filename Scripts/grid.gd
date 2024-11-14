extends TileMapLayer

const MUSHROOM = preload("res://Scenes/mushroom.tscn")

var tile_size = self.tile_set.tile_size
var half_tile_size = tile_size / 2.0

var grid_size = Vector2(20,30)
var grid = []

enum ENTITY {PLAYER, MUSHROOM, SEGMENT}


func _ready() -> void:
	for x in range(grid_size.x):
		grid.append([])
		for y in range(grid_size.y):
			grid[x].append(null)
		
	var positions = []
	for n in range(5):
		var grid_pos = Vector2(randi() % int(grid_size.x), randi() % int(grid_size.y))
		if not grid_pos in positions:
			positions.append(grid_pos)
		
	for pos in positions:
		var new_mush = MUSHROOM.instantiate()
		new_mush.position = (map_to_local(pos) + half_tile_size)
		grid[pos.x][pos.y] = ENTITY.MUSHROOM
		add_child(new_mush)


# return true is cell is empty, else false
func _is_cell_empty():
	pass

func update_child_pos(child, new_pos, direction):
	pass
