extends Node2D

var chemSo = ["Cl-,K+", "C2042-,Na+,Na+", "K+,F-", "Al3+,Cl-,Cl-,Cl-", "CO2-3,Na+,Na+", "Pb2+,NO-2, NO-2", "Ca2+,Br-,Br-", "K+,NO3-", "Fe3+,Cl-,Cl-,Cl-","Na+,Na+,Na+,PO3-4", "K+, K+, K+, AsO3-4", "Cd2+, SO2-4", "Cr3+, SCN-, SCN-, SCN-", "Li+, ClO-4", "Ag+, NO-3", "K+, K+, CrO2-4", "OH-, PO3-4, Na+, Na+, Na+, Na+", "AsO3-4, OH-, Na+, Na+, Na+, Na+", "Hg2+, ClO-4, ClO-4", "Hg2+2, NO-3, NO-3"]
var chemCo = ["AgBr,MgCO3,Hg2(NO3)2", "CaSO4,CaCL2,KCl", "MgS04,CuS04,Ca2(PO4)2", "NaOH,Ba3(PO4)2,KClO3", "NH4I,Fe(OH)3,CaO","ZnClO4,Na3PO4,NiS", "K2CO3,MgCl2,NH4C2H3O2", "FeCl3,Al2(SO4)3,Ag2CO3", "KSCN,NaOH,LiC2h3O2", "NH4F,KI,CaCl2", "FeCl3, NaBr, KF", "NaC2H3O2, K2SO4, Na2S", "NaOH, KClO4, Na2SO4", "CuO, AlBr3, Ca(OH)2", "NaCl, KF, Ca(ClO4)2", "KCl, LiBr, BaCl2", "NaOH, Ca(NO3)2, KBr", "CuCl2, KC3H3O2, NaI", "K2S, KBr, NaCl", "Na2CO3, KClO4, LiNO3"]
var chemAws = ["Hg2(NO3)2", "CaCl2","MgSO4","NaOH","CaO", "Na3PO4", "K2CO3","none", "NaOH", "CaCl2", "NaCl", "BaCl2", "Ca(NO3)2", "CuCl2", "K2S", "Na2CO3"]

var numbers = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
var count = 16
var lvlCount = 16




# Called when the node enters the scene tree for the first time.
func _ready():
	$HUD.hide()
	randomize()
	numbers.shuffle()
	print(numbers)
	$CharacterBody2D.position.x = -96
	$CharacterBody2D.position.y = 63
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _selectProb():
	var problem = numbers[0]
	numbers.pop_front()
	var compoundChoices = chemCo[problem].split(",", true,4)
	print(compoundChoices)

func _input(event):
	if(GlobalVariables.hudClickedIncorrect == true):
		$BridgeHitbox/CollisionShape2D.disabled = true
	elif(GlobalVariables.hudClickedCorrect == true):
		$BridgeHitbox/CollisionShape2D.disabled = true


func _on_change_scene_body_entered(body):
	get_tree().change_scene_to_file("res://Main.tscn")
