extends Area2D

var energy_storage := 100.0

signal waystation_transfer(amount:float)

func transfer_energy() -> float:
	var energy_available = energy_storage
	energy_storage = 0
	return energy_available


func _on_body_entered(_body: Node2D) -> void:
	if (energy_storage > 0):
		emit_signal("waystation_transfer", transfer_energy())
