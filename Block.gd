extends KinematicBody2D

onready var down = get_node('RayCast')
onready var up = get_node('UP')
var velocity = Vector2()
var gravity = 7
const speed = 0.1
const TIME_UNTIL_FALL = 2.0
var time_remaining = TIME_UNTIL_FALL

#func wait():
#	var t = Timer.new() 		# Create a new Timer node
#	t.set_wait_time(2) 		# Set the wait time
#	add_child(t)			# Add it to the node tree as the direct childt.start()
#	yield(t, "timeout")

func _physics_process(delta):
	if (down.is_colliding() == false):	
		if time_remaining <= 0:
			velocity.y += gravity*delta*speed
			move_and_collide(velocity)
		else :	
			time_remaining -= delta
	
	else:
		time_remaining = TIME_UNTIL_FALL
	
