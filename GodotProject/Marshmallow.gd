extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
var is_squished = false
var was_squished = false
var is_moving = false
var is_left = false
export var hp = 3
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	$Label.text = "hp: " + str(hp)
	var velocity_vector = Vector2()
	was_squished = is_squished
	is_squished = false
	is_moving = false
	
	if Input.is_action_pressed("ui_down"):
		if not was_squished:
			$AudioStreamPlayer.play()
		is_squished = true
		
		#velocity_vector += Vector2(0, 1000)
	if Input.is_action_pressed("ui_right") and not is_squished:
		velocity_vector += Vector2(100, 0)
		is_moving = true
		is_left = false
	if Input.is_action_pressed("ui_left") and not is_squished:
		velocity_vector += Vector2(-100, 0)
		is_moving = true
		is_left = true
	if Input.is_action_pressed("ui_up"):
		velocity_vector += Vector2(0, -1000)
		
		
	_animation_controller()
	move_and_slide(velocity_vector)


func _animation_controller():
	if is_left:
		$AnimatedSprite.scale = Vector2(-1, 1)
	else:
		$AnimatedSprite.scale = Vector2(1, 1)

	if is_squished:
		$AnimatedSprite.animation = "squish"
	elif is_moving:
		$AnimatedSprite.animation = "move"
	else:
		$AnimatedSprite.animation = "default"