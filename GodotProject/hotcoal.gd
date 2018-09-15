extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
var moving_right = false

func _ready():
	pass


func _process(delta):
	var velocity_vector = Vector2()
	print($RightWallCollider.get_overlapping_bodies())
	if $RightWallCollider.get_overlapping_bodies().size() > 1 :
		moving_right = false
	if $LeftWallCollider.get_overlapping_bodies().size() > 1 :
		moving_right = true
	
	if moving_right:
		velocity_vector.x += 100
		$AnimationPlayer.current_animation = "rollcw"
	else:
		velocity_vector.x += -100
		$AnimationPlayer.current_animation = "rollccw"
	#velocity_vector.y += 1000
	move_and_slide(velocity_vector)
