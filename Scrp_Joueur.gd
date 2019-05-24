extends KinematicBody2D

# Declare member variables here. Examples:
var speed = 750
var jump_speed = 400
var gravity = 10

var velocity = Vector2()

onready var AnimPerso = get_node("AnimatedSprite")
var direction

func _physics_process(delta):
	velocity.x = (int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))) * speed
	
	if (Input.is_action_just_pressed("jump")):
		velocity.y = -jump_speed
	velocity.y += gravity
	
	velocity = move_and_slide(velocity, Vector2(0,-1))
	
	if (Input.is_action_pressed("right")):
		$AnimatedSprite.play("Droite")
	elif (Input.is_action_pressed("left")):
		$AnimatedSprite.play("Gauche")
	else : 
		$AnimatedSprite.play("Static")
		
		
	