extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	



func _on_area_2d_input_event(viewport, event, shape_idx):
	if(event is InputEventMouseButton):
		if(event.button_index == MOUSE_BUTTON_LEFT and event.pressed):
			if(get_node("/root/Main")._rng_selector(shape_idx) == true):
				print("clicked right box")
				GlobalVariables.hudClickedIncorrect = false
				GlobalVariables.hudClickedCorrect = true
			else:
				print("clicked wrong box")
				get_node("/root/Main/Bridge").hide()
				GlobalVariables.hudClickedIncorrect = true
				GlobalVariables.hudClickedCorrect = false

func _updateTB(solution1, solution2, solution3):
	$Area2D/Element1/Label1.text = solution1
	$Area2D/Element2/Label2.text = solution2
	$Area2D/Element3/Label3.text = solution3
	$Area2D/Element4/Label4.text = "none"
	
