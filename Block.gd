extends KinematicBody2D

onready var down = get_node('RayCast2D')
var velocity = Vector2()
var gravity = 3
const speed = 0.06
var t = Timer.new() 		# Create a new Timer node


func _physics_process(delta):
	#t.set_wait_time(5.5) 		# Set the wait time
	#add_child(t)			# Add it to the node tree as the direct child
		
	if (down.is_colliding() == false):
		#t.start()
		#yield(t, "timeout")
		velocity.y += gravity*delta*speed
		move_and_collide(velocity)
		
	else:
        velocity.y = 0