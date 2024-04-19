extends Node2D

func _ready():
	if(GlobalVariables.score < 16):
		$Camera2D/Label.text = "Game Over, Your score was: " + str(GlobalVariables.score)
	else:
		$Camera2D/Label.text = "Congratulations, Your got the High score of: " + str(GlobalVariables.score) + " in " + str(GlobalVariables.lives) + " lives"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_restart_game_btn_pressed():
	get_tree().change_scene_to_file("res://Main.tscn")


func _on_title_screen_btn_pressed():
	get_tree().change_scene_to_file("res://TitlePage.tscn")


