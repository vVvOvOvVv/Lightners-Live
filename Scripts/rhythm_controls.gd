extends Sprite2D

@onready var l_sprite: AnimatedSprite2D = $"Left Hit"
@onready var r_sprite: AnimatedSprite2D = $"Right Hit"
@onready var r_area: CollisionShape2D = $"Right Hit/R Area/R HitBox"
@onready var l_area: CollisionShape2D = $"Left Hit/L Area/L HitBox"

func _ready():
	r_area.disabled = true
	l_area.disabled = true

func _process(_delta: float) -> void:
	print(l_area.disabled)
	if Global.GAME_STATE == Global.STATES.PERFORM:
		_input_handler()
	
func _input_handler():
	if Input.is_action_just_pressed("left note"):
		l_sprite.play("hit")
		if l_area.disabled:
			l_area.disabled = false
	if Input.is_action_just_pressed("right note"):
		r_sprite.play("hit")
		if r_area.disabled:
			r_area.disabled = false
	
	if Input.is_action_just_released("left note"):
		l_sprite.play("idle")
		if !l_area.disabled:
			l_area.disabled = true
	if Input.is_action_just_released("right note"):
		r_sprite.play("idle")
		if !r_area.disabled:
			r_area.disabled = true
			
