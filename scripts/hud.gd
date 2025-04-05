extends CanvasLayer

@onready var energy_label: Label = $EnergyLabel

func _on_submersible_energy_update(energy: float) -> void:
	energy_label.text = "Energy: "+str(energy).pad_decimals(1)
