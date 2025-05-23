extends Area2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("remove_energy"):
		body.remove_energy(10)
		animation_player.play("death")
		audio_stream_player_2d.play()
