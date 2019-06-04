extends KinematicBody2D

# Declare member variables here. Examples:
var speed = 500
var jump_speed = 500
var gravity = 20
var velocity = Vector2()

var all_piece = preload("res://Scene/grille.gd")

onready var bas = get_node("Downn")
onready var droite = get_node("Rightt")
onready var gauche = get_node("Leftt")
	
func _ready():
	set_physics_process(true)
	
	
func get_input():
	var collider
	var colliRight
	var colliLeft
	
	if (Input.is_action_pressed("right")):
		$AnimatedSprite.play("Droite")
	elif (Input.is_action_pressed("left")):
		$AnimatedSprite.play("Gauche")
		
	elif (Input.is_action_pressed("click")):
		if bas.is_colliding():
			collider = bas.get_collider()
			collider.queue_free()
			$AnimatedSprite.play("ShootDown")
			
	elif (Input.is_action_just_pressed("ui_right")):
		if droite.is_colliding():
			colliRight = droite.get_collider()
			if colliRight.is_in_group("Blocks"):
				colliRight.queue_free()
			
	elif (Input.is_action_just_pressed("ui_left")):
		if gauche.is_colliding():
			colliLeft = gauche.get_collider()
			if colliLeft.is_in_group("Blocks"):
				colliLeft.queue_free()
	
	else:
		$AnimatedSprite.play("Static")
			
func _physics_process(delta):
	velocity.x = (int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))) * speed
	
	if (is_on_floor() and Input.is_action_just_pressed("jump")):
		velocity.y = -jump_speed
	
	velocity.y += gravity
	
	velocity = move_and_slide(velocity, Vector2(0,-1)) 
	get_input()
		
