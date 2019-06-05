extends TextEdit

var score = 0 setget set_score


func _ready():
	pass
	
func set_score(new_value):
	score = new_value
	get_node("label").set_text(str(score))
	
	
	if score > Perso.bestscore:
		Perso.bestscore = score
	pass




 
