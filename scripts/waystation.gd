extends Area2D

signal waystation_transfer(amount:float)

@onready var energise_player: AudioStreamPlayer2D = $EnergisePlayer

var energy_storage := 20.0

func transfer_energy() -> float:
	var energy_available = energy_storage
	energy_storage = 0
	return energy_available


func _on_body_entered(_body: Node2D) -> void:
	if (energy_storage > 0):
		energise_player.play()
		emit_signal("waystation_transfer", transfer_energy())
