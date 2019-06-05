extends Node2D

var bestscore = 0 setget set_bestscore
const filepath = "user://bestscore.data"

# Called when the node enters the scene tree for the first time.
func _ready():
	load_bestscore()
	pass # Replace with function body.
	
func load_bestscore():
	var file = File.new()
	if not file.file_exists (filepath): return
	file.open(filepath,File.READ)
	bestscore = file.get_var()
	file.close()
	pass
	
func save_bestscore():
	var file = File.new()
	file.open(filepath, File.WRITE)
	file.store_var(bestscore)
	file.close()
	pass
func set_bestscore(new_value):
	bestscore = new_value
	save_bestscore()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
