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


# return true if cell is empty, else false
func _is_cell_empty(pos, direction):
	var grid_pos = Vector2(local_to_map(pos)) + direction
	
	#true if next direction is within the grid
	if grid_pos.x < grid_size.x and grid_pos.x >= 0:
		if grid_pos.y < grid_size.y and grid_pos.y >= 0:
			#grid pos is empty
			if grid[grid_pos.x][grid_pos.y] == null:
				return true
	return false

# moves a child to a new position in the grid array
# returns the new target world position of the child
func update_child_pos(child_node):
	var grid_pos: Vector2 = local_to_map(child_node.get_position())
	grid[grid_pos.x][grid_pos.y] = null
	var new_grid_pos = grid_pos + child_node.direction
	grid[new_grid_pos.x][new_grid_pos.y] = child_node.type
	
	var target_pos = map_to_local(new_grid_pos)
	return target_pos
	
