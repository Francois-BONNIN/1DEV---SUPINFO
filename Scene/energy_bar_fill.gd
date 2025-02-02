extends Sprite

signal health_changed
signal died

export var max_health = 18
var health = max_health

# When the character dies, we fade the UI
enum STATES {ALIVE, DEAD}
var state = STATES.ALIVE

# Implement stamina as an exercise + solution!
#var max_energy = 18
#var energy = max_energy

func take_damage(count):
	if state == STATES.DEAD:
		return

	health -= count
	if health <= 0:
		health = 0
		state = STATES.DEAD
		emit_signal("died")

	$AnimationPlayer.play("take_hit")

	emit_signal("health_changed", health)

func _on_AnimationPlayer_animation_finished( name ):
	if state != STATES.DEAD:
		return
	if name != "take_hit":
		return

	$AnimationPlayer.play("die")

