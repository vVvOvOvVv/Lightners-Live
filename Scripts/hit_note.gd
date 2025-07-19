extends AnimatedSprite2D

@onready var fx: AnimatedSprite2D = self.get_child(1)

func hit_area(area: Area2D):
	#if Input.is_action_just_pressed("left note") or Input.is_action_just_pressed("right note"):
	if area.get_meta("isPerfect"):
		fx.play("perfect")
		area.get_parent().queue_free()
	else:
		fx.play("almost")
		area.get_parent().queue_free()
