extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	for body in get_overlapping_bodies():
		
		if typeof(body.get("hp")) != TYPE_NIL:
			var hp = body.get("hp")
			if hp > 0:
				hp = hp-5*delta
			body.set("hp", hp)
