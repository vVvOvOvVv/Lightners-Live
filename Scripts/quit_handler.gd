extends Timer

@onready var label: Label = $"../QuitLabel"
@onready var timer: Timer = $"."

func _ready():
	label.visible = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("escape"):
		timer.start()
		label.visible = true
	elif Input.is_action_just_released("escape"):
		timer.stop()
		label.visible = false

func _quit_game():
	get_tree().quit()
