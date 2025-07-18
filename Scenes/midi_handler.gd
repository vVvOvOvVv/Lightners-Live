extends MidiPlayer

# to instantiate notes
const LEFT_NOTE = preload("res://Scenes/Interface/left_note.tscn")
const RIGHT_NOTE = preload("res://Scenes/Interface/right_note.tscn")
@onready var left_holder: Node2D = $"../Notes/Left Holder"
@onready var right_holder: Node2D = $"../Notes/Right Holder"

# MidiPlayer & audio
@onready var player: MidiPlayer = $"."
@onready var asp: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var audio_delay: Timer = $"Audio Delay"

func _ready():
	audio_delay.wait_time = Global.AUDIO_DELAY
	audio_delay.one_shot = true
	audio_delay.start()
	
	player.note.connect(note_callback) # on MIDI note/signal, trigger note_callback
	player.play()

func note_callback(event, _track):
	if event["subtype"] == MIDI_MESSAGE_NOTE_ON:
		match event["note"]:
			38: # left tap
				instantiate_note(LEFT_NOTE, left_holder)
			36: # right tap
				instantiate_note(RIGHT_NOTE, right_holder)
			39: # left hold
				print("Left hold")
			35: # right hold
				print("Right hold")
			_: # error handling
				push_error("Unexpected note: " + str(event["note"]))

func instantiate_note(note_res: Resource, location: Node2D):
	var instance = note_res.instantiate()
	location.add_child(instance)
	
func play_audio():
	asp.play()
