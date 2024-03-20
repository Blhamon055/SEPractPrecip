extends CanvasLayer

var rng = RandomNumberGenerator.new()
var my_rnd_num = rng.randi_range(0,1)

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	print(my_rnd_num)



func _on_area_2d_input_event(viewport, event, shape_idx):
	if(event is InputEventMouseButton):
		if(event.button_index == MOUSE_BUTTON_LEFT and event.pressed):
			if(_rng_selector(shape_idx) == false):
				get_node("/root/Main/Bridge").hide()
				print("clicked wrong box")
				GlobalVariables.hudClickedIncorrect = true
				GlobalVariables.hudClickedCorrect = false
			else:
				print("clicked right box")
				GlobalVariables.hudClickedIncorrect = false
				GlobalVariables.hudClickedCorrect = true


func _rng_selector(x):
	if(x == my_rnd_num):
		return true
	else:
		return false
	
