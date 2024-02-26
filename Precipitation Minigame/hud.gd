extends CanvasLayer

var rng = RandomNumberGenerator.new()
var my_rnd_num = rng.randi_range(1,2)

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)



func _on_area_2d_input_event(viewport, event, shape_idx):
	if(event is InputEventMouseButton):
		if(event.button_index == MOUSE_BUTTON_LEFT and event.pressed):
			if(_rng_selector(shape_idx) == true):
				print("clicked the right box")
			else:
				print("clicked wrong box")


func _rng_selector(x):
	if(x == my_rnd_num):
		return true
	else:
		return false
	
