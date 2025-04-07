extends Node2D

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("toggle_music"):
		if audio_stream_player.playing:
			audio_stream_player.stream_paused = true
		else:
			audio_stream_player.stream_paused = false
		
