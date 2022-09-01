extends TileMap

var ids = {
	"Q": [0, 1],
	"W": [2, 3],
	"E": [4, 5],
	"R": [6, 7],
	"T": [8, 9],
	"Y": [10, 11],
	"U": [12, 13],
	"I": [14, 15],
	"O": [16, 17],
	"P": [18, 19],
	"A": [20, 21],
	"S": [22, 23],
	"D": [24, 25],
	"F": [27, 28],
	"G": [29, 30],
	"H": [32, 33],
	"J": [34, 35],
	"K": [36, 37],
	"L": [39, 38], # me equivoqué al hacer las tiles, no sé como arreglarlo xd
	"Z": [41, 42],
	"X": [43, 44],
	"C": [45, 46],
	"V": [47, 48],
	"B": [49, 50],
	"N": [51, 52],
	"M": [53 ,54],
}

func getIds():
	return ids
	
func findTileKeyById(id):
	for key in ids:
		if id in ids[key]:
			return  key
	return "NOTFOUND"

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
