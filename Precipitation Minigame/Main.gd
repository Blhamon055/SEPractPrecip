extends Node2D


var chemSo = ["Cl\u207B,K\u207A", "C2O24,Na\u207A,Na\u207A", "K\u207A,F\u207B", "Al3+,Cl\u207B,Cl\u207B,Cl\u207B", "CO2-3,Na\u207A,Na\u207A", "Pb2+,NO-2, NO-2", "Ca2+,Br\u207B,Br\u207B", "K\u207A,NO3-", "Fe3+,Cl\u207B,Cl\u207B,Cl\u207B","Na\u207A,Na\u207A,Na\u207A,PO3-4", "K\u207A, K\u207A, K\u207A, AsO3-4", "Cd2+, SO2-4", "Cr3+, SCN\u207B, SCN\u207B, SCN\u207B", "Li\u207A, ClO-4", "Ag\u207A, NO-3", "K\u207A, K\u207A, CrO2-4", "OH\u207B, PO3-4, Na\u207A, Na\u207A, Na\u207A, Na\u207A", "AsO3-4, OH\u207B, Na\u207A, Na\u207A, Na\u207A, Na\u207A", "Hg2+, ClO-4, ClO-4", "Hg2+2, NO-3, NO-3"]
var chemCo = ["AgBr,MgCO\u2083,Hg\u2082(NO\u2083)\u2082", "CaSO\u2084,CaCL\u2082,KCl", "MgS0\u2084,CuS0\u2084,Ca\u2082(PO\u2084)\u2082", "NaOH,Ba\u2083(PO\u2084)\u2082,KClO\u2083", "NH\u2084I,Fe(OH)\u2083,CaO","ZnClO\u2084,Na\u2083PO\u2084,NiS", "K\u2082CO\u2083,MgCl\u2082,NH\u2084C\u2082H\u2083O\u2082", "FeCl\u2083,Al\u2082(SO\u2084)\u2083,Ag\u2082CO\u2083", "KSCN,NaOH,LiC\u2082h\u2083O\u2082", "NH\u2084F,KI,CaCl\u2082", "FeCl\u2083, NaBr, KF", "NaC\u2082H\u2083O\u2082, K\u2082SO\u2084, Na\u2082S", "NaOH, KClO\u2084, Na\u2082SO\u2084", "CuO, AlBr\u2083, Ca(OH)\u2082", "NaCl, KF, Ca(ClO\u2084)\u2082", "KCl, LiBr, BaCl\u2082", "NaOH, Ca(NO\u2083)\u2082, KBr", "CuCl\u2082, KC\u2083H\u2083O\u2082, NaI", "K\u2082S, KBr, NaCl", "Na\u2082CO\u2083, KClO\u2084, LiNO\u2083"]
var chemAws = ["Hg2(NO3)2", "CaCl2","MgSO4","NaOH","CaO", "Na3PO4", "K2CO3","none", "NaOH", "CaCl2", "NaCl", "BaCl2", "Ca(NO3)2", "CuCl2", "K2S", "Na2CO3"]

var numbers = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
var count = 16
var lvlCount = 16


var rng = RandomNumberGenerator.new()
var my_rnd_num = rng.randi_range(0,1)



# Called when the node enters the scene tree for the first time.
func _ready():
	$HUD.hide()
	randomize()
	numbers.shuffle()
	print(my_rnd_num)
	print(numbers)
	$CharacterBody2D.position.x = -96
	$CharacterBody2D.position.y = 63
	GlobalVariables.hudClickedCorrect = false
	GlobalVariables.hudClickedIncorrect = false


func _rng_selector(x):
	if(x == my_rnd_num):
		return true
	else:
		return false
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _selectProb():
	var problem = numbers[0]
	var answer = chemAws[numbers[0]]
	numbers.pop_front()
	var compoundChoices = chemCo[problem].split(",", true,4)
	print(compoundChoices)
	print(answer)
	print(numbers)

func _input(event):
	if(GlobalVariables.hudClickedIncorrect == true):
		$CharacterBody2D.set_collision_mask_value(3, false)
		$BridgeHitbox.set_collision_mask_value(1, false)
	elif(GlobalVariables.hudClickedCorrect == true):
		$CharacterBody2D.set_collision_mask_value(3, false)
		$BridgeHitbox.set_collision_mask_value(1, false)


func _on_change_scene_body_entered(body):
	$CharacterBody2D.position.x = -96
	$CharacterBody2D.position.y = 63
	
	GlobalVariables.hudClickedCorrect = false
	GlobalVariables.hudClickedIncorrect = false
	$CharacterBody2D.set_collision_mask_value(3, true)
	$BridgeHitbox.set_collision_mask_value(1, true)
