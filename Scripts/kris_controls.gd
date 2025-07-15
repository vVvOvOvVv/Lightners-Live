extends CharacterBody2D

enum global_states {MENU, SONG_SELECT, PERFORM} 
# menu == 0, song == 1, perform == 2
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.GAME_STATE = global_states.PERFORM
	Global.IS_ALT_NOTE = false
	Engine.max_fps = 30

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# apparently Godot's version of switch-case is match
	match Global.GAME_STATE:
		global_states.MENU:
			pass
		global_states.SONG_SELECT:
			pass
		global_states.PERFORM:
			_perform_input()
		_: # error handling
			push_error("The forbidden state has been achieved")
			
func _perform_input() -> void:
	# low/left notes
	if Input.is_action_just_pressed("left note"):
		if Global.IS_ALT_NOTE:
			animated_sprite.play("alt_note_down")
		else:
			animated_sprite.play("low_note_down")
	elif Input.is_action_just_released("left note"):
		if Global.IS_ALT_NOTE:
			animated_sprite.play("alt_note_up")
		else:
			animated_sprite.play("low_note_up")
	# high/right notes
	elif Input.is_action_just_pressed("right note"):
		if Global.IS_ALT_NOTE:
			animated_sprite.play("alt_note_down")
		else:
			animated_sprite.play("high_note_down")
	elif Input.is_action_just_released("right note"):
		if Global.IS_ALT_NOTE:
			animated_sprite.play("alt_note_up")
		else:
			animated_sprite.play("high_note_up")
			
	# misc. inputs
