extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)



func _on_area_2d_input_event(viewport, event, shape_idx):
	if(event is InputEventMouseButton):
		if(event.button_index == MOUSE_BUTTON_LEFT and event.pressed):
			print("clicked")
