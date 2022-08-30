extends TileMap

var ids = {
	"Q": [0, 1],
	"W": [2, 3],
	"E": [4, 5]
}

func handle_input(input):
	if Input.is_action_just_pressed(input):
		var cells = get_used_cells_by_id(ids[input][0])
		for cell in cells:
			set_cell(cell.x, cell.y, ids[input][1])
			
	if Input.is_action_just_released(input):
		var cells = get_used_cells_by_id(ids[input][1])
		for cell in cells:
			set_cell(cell.x, cell.y, ids[input][0])
	
func read_input():
	for input in ids:
		handle_input(input)			
			
func _physics_process(delta):
	read_input()
